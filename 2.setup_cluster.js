//----------------------------------------------------
//
//  CREATE AND INITIATE THE REPLICA SETS AND SHARDS
//
//----------------------------------------------------
//
//------------------------------------------------
// 0. Set myName to the name of the computer
//------------------------------------------------
//
var myName = "DESKTOP-GIC9RBH";
//
//------------------------------------------------
// 1. GLOBAL VARIABLES (I don't understand this)
//------------------------------------------------
//
db = db.getSisterDB("config");
var mongosConn = db;
var res = null;
//
//------------------------------------------------
// 2. SET THE CHUNK SIZE
//------------------------------------------------
//
db.settings.save( { _id:"chunksize", value: 1 } )
//
//------------------------------------------------
// 3. DUBLIN
//------------------------------------------------
//
// 1. CONNECT TO THE PROPER mongod PROCESS
//
var clusters = ["Dublin", "Cork", "Limerick", "Galway"];
var index = 0;
var basePort = 27000;

for (index = 0; index < clusters.length; index++) {
    var city = clusters[index];

    db = connect(myName + ".local:" + basePort + "/test");
    res = rs.initiate(
        {
            "_id" : city.toLowerCase(),
            "members" : [
                { _id:0,host:myName+".local:"+basePort },
                { _id:1,host:myName+".local:"+(basePort + 1) },
                { _id:2,host:myName+".local:"+(basePort + 2) }
            ]
        }
    );
    //
    // 3. WAIT UNTIL ALL THE NODES OF THE REPLICA SET ARE UP AND RUNNING
    // //
    while (res.ok != 1){
        sleep(10);
    }
    print(city + " Replica Set Created!");
    while (((rs.status().members[0].state != 1) && (rs.status().members[0].state != 2)) || ((rs.status().members[1].state != 1) && (rs.status().members[1].state != 2)) || ((rs.status().members[2].state != 1) && (rs.status().members[2].state != 2))) {
        sleep(10);
    }
    print(city + " Replica Set Up!");
    //
    // 4. ADD THE SHARD
    //
    db = mongosConn;
    res = sh.addShard(city.toLowerCase() + "/" + myName + ".local:" + basePort);
    while (res.ok != 1){
        sleep(60);
        if (res.ok != 1){
            print("Adding Shard Failed. Trying it again");
            res = sh.addShard(city.toLowerCase() + "/" + myName + ".local:" + basePort);
        }
    }
    print(city + " Shard Added!");
    basePort += 100;
}
quit()
