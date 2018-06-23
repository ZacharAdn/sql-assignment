import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class q2 {
    private static void callProc(String sql) {
        try {
            try (Connection con = DriverManager.getConnection
                    ("jdbc:mysql://localhost:3306/assignment2?autoReconnect=true&useSSL=false", "root", "ad45nm")) {
                PreparedStatement stmt = con.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery(sql);
                int numOfColumns = rs.getMetaData().getColumnCount();
                while (rs.next()) {
                    for (int col = 1; col <= numOfColumns; col++) {
                        System.out.print(rs.getString(col) + " ");
                    }
                    System.out.println();
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static void main(String[] args) {
        callProc("call matching2(123)");
    }
}

