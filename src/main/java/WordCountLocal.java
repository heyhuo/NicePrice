//import org.apache.spark.SparkConf;
//import org.apache.spark.api.java.JavaPairRDD;
//import org.apache.spark.api.java.JavaRDD;
//import org.apache.spark.api.java.JavaSparkContext;
//import org.apache.spark.api.java.function.*;
//import scala.Tuple2;
//
//import java.util.Arrays;
//
//public class WordCountLocal {
//    public static void main(String[] args) {
//        /**
//         * 创建sparkConfig对象，设置spark应用配置信息,
//         setMaster设置spark应用程序要连接的spark集群的master节点的url,
//         local则代表在本地运行
//         */
//        SparkConf conf = new SparkConf().setAppName("WordCountLocal").setMaster("local");
//
//        /**
//         * 创建JavaSparkContext 对象（最重要的对象）
//         */
//        JavaSparkContext sc = new JavaSparkContext(conf);
//
//        /**
//         * 针对输入源（hdfs文件、本地文件等）创建一个初始的RDD,这里是本地测试，所以就针对本地文件
//         * textFile（）方法用于根据文件类型的输入源创建RDD
//         * RDD的概念：如果是hdfs或者本地文件，创建的RDD每个元素就相当于是文件里的一行。
//         */
//        JavaRDD<String> lines = sc.textFile("/Users/huoshan/IdeaProjects/NicePrice/src/main/resources/data/spark.txt");
//
//        /**
//         * 对初始RDD进行transformation 计算操作
//         * 通常操作会通过创建function，并配合RDD的map、flatMap等算子来执行
//         * function通常，如果比较简单，则创建指定function的匿名内部类
//         * 如果function比较复杂，则会单独创建一个类，作为实现这个function接口的类
//         * 现将每一行拆分成单个的单词
//         * FlatMapFunction，有两个泛型阐述，分别代表了输入和输出类型
//         * 这里只用FLatMap算子的作用，其实就是讲RDD的一个元素，给拆分成一个或多个元素。
//         */
//        JavaRDD<String> words = lines.flatMap((FlatMapFunction<String, String>) s -> {
//            //分割
//            return Arrays.asList(s.split(" "));
//        });
//
//        /**
//         * 接着，需要将每一个单词，映射为（单词，1）的这种格式来进行每个单词的出现次数的累加
//         * mapTopair其实就是将每个元素以后干涉为一个（v1,v2）这样的Tuple2类型的元素
//         * 如果还记得scala的tuple，那么没错，这里的tuple2就是scala类型，包含了两个值
//         * mapToPair这个算子，要求的是与PairFunction配合使用，第一给泛型参数代表了 输入类型
//         * 第二个和第三个泛型参数，代表的输出的Tuple2的第一给值和第二个值的类型
//         * JavaPairRdd的两个泛型参数，分别代表了tuple元素的第一给值和第二个值的类型
//         */
//        JavaPairRDD<String, Integer> pairs = words.mapToPair((PairFunction<String, String, Integer>) word -> new Tuple2<String, Integer>(word, 1));
//
//        /**
//         * 然后需要以单词作为key，统计每个单词出现的次数
//         * 这里要使用reduceBykey这个算子对每个key对应的value都进行reduce操作
//         * 比如JavaPairRDD中有几个元素，假设分别为（hello，1）（hello，1）（hello，1）
//         * reduce操作相当于是吧第一个值和第二个值进行计算，然后再讲结果与第三个至进行计算
//         * 比如这里的helo，那么就相当于是，1+1=2，然后2+1=3
//         * 最后返回的JavaPairRdd中的元素，也是tuple，但是第一个值就是每个key，第二个值就是key的value，也就是次数
//         */
//        JavaPairRDD<String, Integer> wordCounts = pairs.reduceByKey((Function2<Integer, Integer, Integer>) (v1, v2) -> v1 + v2);
//
//        /**
//         * 我们已经统计出了单词的次数
//         * 但是，之前我们使用的flatMap、mapToPair、reduceByKey这种操作，都叫做transformation操作
//         * 一个Spark应用中，只有transformation操作是不行的，我用foreach来触发程序的执行
//         */
//        wordCounts.foreach((VoidFunction<Tuple2<String, Integer>>) wordCount -> System.out.println(wordCount._1 + "appeared " + wordCount._2));
//
//    }
//}
