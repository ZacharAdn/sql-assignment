import java.sql.*;

public class Q4 {
    public static void main(String[] args) {
        Connection c;
        try {
            c = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignment2?autoReconnect=true&useSSL=false", "root", "ad45nm");
            Statement st = c.createStatement();
            System.out.println("soldiers num: " + solSearch(st));
            System.out.println("families num: " + famDisplay(st));
            System.out.println("soldiers and families in the same city: " + cityFitted(st);
            System.out.println("soldiers and families in the same area: " + areaFitted(st);
            System.out.println("soldiers that didnt have a match: ");
            noMatch(st);
            System.out.println("families that didnt have a match: ");
            noMatchFam(st);
            System.out.println("most common area: " + areaMost(st));
            System.out.println("most common language: " + showCommonLang(st));
            System.out.println("most signs soldiers: " + mostRegistered(st));
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static int solSearch(Statement st) {
        String s = "SELECT count(firstname) from soldiers;";

        try {
            ResultSet res = st.executes(s);
            res.next();
            return res.getInt(1));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static int famDisplay(Statement st) {
        String s = "SELECT count(familyname) from families;";
        try {
            ResultSet res = st.executes(s);
            res.next();
            return res.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static int cityFitted(Statement st) {
        String s = "call q4_3";
        try {
            ResultSet res = st.executes(s);
            res.next();
            return res.getString(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static int areaFitted(Statement st) {
        String s = "call q4_4";
        try {
            ResultSet res = st.executes(s);
            res.next();
            return res.getString(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void noMatch(Statement st) {
        String s = "call q4_5 ();";
        int x = 0;
        try {
            ResultSet res = st.executes(s);

            while (res.next()) {
                x++;
                for (int i = 1; i < 6; i++) {
                    System.out.print(res.getString(i) + ",");
                }
                System.out.println();
            }
            System.out.println("\n num: " + x + "\n");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void noMatchFam(Statement st) {
        String s = "call q4_6 ();";
        int x = 0;
        try {
            ResultSet res = st.executes(s);
            while (res.next()) {
                x++;
                for (int i = 1; i < 6; i++) {
                    System.out.print(res.getString(i) + ",");
                }
                System.out.println();
            }
            System.out.println("\n num: " + x + "\n");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static int areaMost(Statement st) {
        String s = "CALL q4_7 ();";
        try {
            ResultSet res = st.executes(s);
            res.next();
            return res.getString(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static int showCommonLang(Statement st) {
        String s = "select LanguageSoldiers.lng from LanguageSoldiers where LanguageSoldiers.lng <> 'Hebrew' GROUP BY lng ORDER BY COUNT(*) DESC LIMIT 1;";
        try {
            ResultSet res = st.executes(s);
            res.next();
            return res.getString(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static int mostRegistered(Statement st) {
        String s = "CALL q4_9 ();";
        try {
            ResultSet res = st.executes(s);
            res.next();
            return res.getString(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
