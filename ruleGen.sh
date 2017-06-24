# @Author: Mandar Gogate <mgo>
# @Date:   2017-06-24T11:48:00+01:00
# @Email:  mandar@ieee.org
# @Filename: ruleGen.sh
# @Last modified by:   mgo
# @Last modified time: 2017-06-24T12:40:25+01:00
# @Copyright: Mandar Gogate

# RUN THE FOLLOWING CODE FOR THE FIRST time
# hdfs dfs -mkdir testL
# hdfs dfs -put ./testL/testLong.txt testL/

hdfs dfs -rmr outputdir
hdfs dfs -rmr outputdir2
rm results.txt

INPUT=Sample/sampledata.txt
JAR=./hadoop-streaming-0.20.2-cdh3u2.jar
hadoop jar $JAR -input $INPUT -output outputdir -mapper fpMap.py -reducer fpReduce.py -file fpReduce.py -file fpMap.py


hadoop jar $JAR -input outputdir/p* -output outputdir2 -mapper ruleMap.py -reducer ruleReduce.py -file ruleReduce.py -file ruleMap.py

hdfs dfs -cat outputdir2/part* > Sample/sampleresults.txt
