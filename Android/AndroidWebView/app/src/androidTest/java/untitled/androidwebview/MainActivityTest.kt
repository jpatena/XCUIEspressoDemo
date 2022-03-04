package untitled.androidwebview

import androidx.test.core.app.ActivityScenario
import androidx.test.espresso.web.sugar.Web.onWebView
import androidx.test.espresso.web.webdriver.DriverAtoms.findElement
import androidx.test.espresso.web.webdriver.Locator
import androidx.test.ext.junit.runners.AndroidJUnit4
import androidx.test.platform.app.InstrumentationRegistry
import androidx.test.rule.ActivityTestRule
import androidx.test.uiautomator.*
import junit.framework.Assert.fail
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(AndroidJUnit4::class)
class MainActivityTest {

    @get:Rule
    val activityRule = ActivityTestRule(MainActivity::class.java, false, false)

    @Before
    fun setup() {
        ActivityScenario.launch(MainActivity::class.java)
    }

    @Test
    fun testLoginValidCredentials() {

        val instr = InstrumentationRegistry.getInstrumentation()
        val device = UiDevice.getInstance(instr)

        onWebView().forceJavascriptEnabled()
        Thread.sleep(5000)
        device.findObject(UiSelector().resourceId("user-name")).click()
        device.findObject(UiSelector().resourceId("user-name")).setText("standard_user")
        device.findObject(UiSelector().resourceId("password")).click()
        device.findObject(UiSelector().resourceId("password")).setText("secret_sauce")
        device.findObject(UiSelector().resourceId("login-button")).click()
        Thread.sleep(5000)

        try {
            onWebView().withElement(findElement(Locator.ID, "inventory_container"))
        } catch (notExist: RuntimeException) {
            fail()
        }
    }

    @Test
    fun testLoginInvalidCredentials() {

        val instr = InstrumentationRegistry.getInstrumentation()
        val device = UiDevice.getInstance(instr)

        onWebView().forceJavascriptEnabled()
        Thread.sleep(5000)
        device.findObject(UiSelector().resourceId("user-name")).click()
        device.findObject(UiSelector().resourceId("user-name")).setText("standard_user")
        device.findObject(UiSelector().resourceId("password")).click()
        device.findObject(UiSelector().resourceId("password")).setText("wrong_sauce")
        device.findObject(UiSelector().resourceId("login-button")).click()
        Thread.sleep(5000)

        try {
            onWebView().withElement(findElement(Locator.ID, "inventory_container"))
            fail()
        } catch (notExist: RuntimeException) {}
    }
}