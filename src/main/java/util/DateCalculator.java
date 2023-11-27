package util;

import java.sql.Date;

public class DateCalculator {

    public int calculateDaysBetween(Date d1, Date d2){
        return (int)( (d2.getTime() - d1.getTime()) / (1000 * 60 * 60 * 24));
    }
}
