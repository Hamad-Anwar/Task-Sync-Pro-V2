
import 'package:intl/intl.dart';
class Utils{

    static String getMonth(DateTime date){
      String formattedDate = DateFormat('MMM').format(date);
      return formattedDate;
    }
    static String getDate(DateTime date){
      String formattedDate = DateFormat('d').format(date);
      if(formattedDate.length==1){
        formattedDate='0$formattedDate';
      }
      return formattedDate;
    }

    static String getDay(DateTime date){
      String formattedDate = DateFormat('EEE').format(date);
      return formattedDate;
    }


}