HADOOP_CMD="/usr/local/hadoop/bin/hadoop"
STREAM_JAR_PATH="/usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-3.1.2.jar"

INPUT_FILE_PATH1="/The_Man_of_Property.txt"
OUTPUT_PATH="/output"

$HADOOP_CMD fs -rmr -skipTrash $OUTPUT_PATH

$HADOOP_CMD jar $STREAM_JAR_PATH \
	-input $INPUT_FILE_PATH1 \
	-output $OUTPUT_PATH \
	-mapper "python3 map.py" \
	-reducer "python3 red.py" \
	-file ./map.py \
	-file ./red.py
