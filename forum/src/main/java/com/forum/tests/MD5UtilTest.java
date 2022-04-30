package com.forum.tests;
import com.forum.util.MD5Util;
import org.junit.*;

public class MD5UtilTest {
    MD5Util md5Util;
    @Before
    public void setMd5Util(){
        md5Util = new MD5Util();
    }
    @After
    public void teardown(){
        md5Util = null;
    }

    @Test
    public void testMD5Util(){
        String result = md5Util.getMD5("12345");
        System.out.println(result);
    }
}
