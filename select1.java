import java.sql.Connection;  // SQL 관련 클래스를 사용하기 위한 import 구문들
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner; // 사용자 입력을 받기 위한 Scanner 

public class select1 {
	// 데이터베이스 연결 정보
    private static final String url = "jdbc:mysql://localhost:3306/hotels?serverTimezone=Asia/Seoul&useSSL=false";
    private static final String user = "testuser";
    private static final String password = "testpw";

    public static void main(String[] args) {
        try (Scanner scanner = new Scanner(System.in)) {
            System.out.println("What is your first name?"); //고객을 위한 정보 요청문
            String firstName = scanner.nextLine(); //firstName 입력 받음
            ViewAndJoin(); //메소드 호출
            select(firstName); //입력 받은 firstName을 변수로 사용하는 메소드 호출
        }
    }

    private static void ViewAndJoin() { //view and join 이용하는 single query

        String sqlCreateView = "CREATE OR REPLACE VIEW selection AS " +
                               "SELECT FirstName, LastName, RoomID " +
                               "FROM Customer JOIN Booking ON Customer.CustomerID = Booking.CustomerID";
        try (Connection conn = DriverManager.getConnection(url, user, password);
             Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(sqlCreateView); //위의 sql문 실행
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void select(String firstName) { //고객한테 받은 정보를 사용해서 고객 이름과 방 번호 조회하는 메소드
        String sqlSelect = "SELECT FirstName, LastName, RoomID FROM selection WHERE FirstName = ?"; //view and join 사용 하지 않은 query
        try (Connection conn = DriverManager.getConnection(url, user, password);
             PreparedStatement ps = conn.prepareStatement(sqlSelect)) {
            ps.setString(1, firstName); //query에 사용자 입력 이름을 설정
            try (ResultSet rs = ps.executeQuery()) {  // 쿼리 실행, 결과 내기
                if (!rs.isBeforeFirst()) { // 결과 집합이 비어있는 경우, (이름이 없는 경우)
                    System.out.println("No such name. Check Again.");
                    return;
                }
                while (rs.next()) { // 결과 집합에서 다음이 없을 때까지 고객 정보 출력
                    System.out.println("Name: " + rs.getString("FirstName") + " " + rs.getString("LastName") +
                                       ", Room: " + rs.getInt("RoomID"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
