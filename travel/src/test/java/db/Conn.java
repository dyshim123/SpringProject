package db;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class Conn {

	@Test
	public void Connection() {
		int sum = 0;
		
		sum = 3 + 5;
		
		System.out.print(sum);

		assertEquals(sum, 8);

	}
}
