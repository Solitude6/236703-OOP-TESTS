
package OOP2.Tests;
import java.util.Iterator;
import junit.framework.Assert;
import org.junit.Test;
import OOP2.Solution.*;
import OOP2.Provided.*;
import java.util.NoSuchElementException;

public class OOP2Tests {
	@Test
	public void test() {
		FaceOOP poop = new FaceOOPImpl();
		Person p0 = null;
		Person p1 = null;
		Person p2 = null;
		Person p3 = null;
		Person p4 = null;
		try {
		p0 = poop.joinFaceOOP(0, "0");
		p1 = poop.joinFaceOOP(1, "1");
		p2 = poop.joinFaceOOP(2, "2");
		p3 = poop.joinFaceOOP(3, "3");
		p4 = poop.joinFaceOOP(4, "4");
		} catch (Exception e) { Assert.fail(); }
		Iterator<Status> it;
		try {
			Status s0 = p2.postStatus("vgpsYjygIA");
		} catch (Exception e) { Assert.fail(); }
		try {
			poop.addFriendship(p2, p2);
		} catch (Exception e) { Assert.fail(); }
		try {
			it = poop.getFeedByRecent(p2);
		} catch (Exception e) { Assert.fail(); }
		try {
			it = poop.getFeedByRecent(p2);
		} catch (Exception e) { Assert.fail(); }
		try {
			it = poop.getFeedByRecent(p0);
		} catch (Exception e) { Assert.fail(); }
		try {
			it = poop.getFeedByRecent(p1);
		} catch (Exception e) { Assert.fail(); }
		try {
			it = poop.getFeedByRecent(p2);
		} catch (Exception e) { Assert.fail(); }
		try {
			it = poop.getFeedByRecent(p3);
		} catch (Exception e) { Assert.fail(); }
		try {
			it = poop.getFeedByRecent(p4);
		} catch (Exception e) { Assert.fail(); }

	}
}
