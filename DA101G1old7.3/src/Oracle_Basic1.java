import java.sql.*;

class Oracle_Basic1 {

    public static void main(String argv[]) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");  //驅動程式-第四類
            
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");     //驅動程式-第一類: JDBC-ODBC橋接器 (Java 8 開始,已不再支援)
          //至 設定-控制台-系統管理工具-資料來源(ODBC)
            //-> 選擇系統資料來源名稱->新增->選Oracle in XE->完成 
            //-> [Data Source Name(資料來源名稱)\輸入:dsn1] [TNS Service Name\選擇:XE] [User ID\輸入:hr] [OK] -> 確定
        } catch (java.lang.ClassNotFoundException e) {
            System.err.print("ClassNotFoundException: ");
            System.err.println(e.getMessage());
        }

        try {
            Connection con =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "DA101G1MER", "123456");
            //Connection con =  DriverManager.getConnection("jdbc:odbc:dsn1", "scott", "tiger");  	  	   	

            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * from MERCHANT");

            while (rs.next()) {
                String str1 = rs.getString(1);
                String str2 = rs.getString(2);

                System.out.print(" MERCHANT NO= " + str1);
                System.out.print(" MERCHANT ID= " + str2);
                System.out.print("\n");
            }

            rs.close();
            stmt.close();
            con.close();

        } catch (SQLException ex) {
            System.err.println("SQLException: " + ex.getMessage());
        }
    }
}