package com.mallmate.selenium;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import org.openqa.selenium.By;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import static org.junit.Assert.*;

public class MallMateSeleniumTest {

    private WebDriver driver;

    private final String baseUrl =
            "http://localhost:8080/mallmate/";

    private final String screenshotFolder =
            "screenshots";


    @Before
    public void setUp() {

        // Launch Chrome
        driver = new ChromeDriver();

        driver.manage().window().maximize();

        // Create screenshots folder
        new File(screenshotFolder).mkdirs();
    }


    // =====================================================
    // SCREENSHOT METHOD
    // =====================================================

    private void takeScreenshot(String fileName) {

        try {

            TakesScreenshot screenshot =
                    (TakesScreenshot) driver;

            File source =
                    screenshot.getScreenshotAs(
                            OutputType.FILE);

            Path destination =
                    Paths.get(
                            screenshotFolder,
                            fileName + ".png");

            Files.copy(
                    source.toPath(),
                    destination,
                    java.nio.file.StandardCopyOption.REPLACE_EXISTING);

            System.out.println(
                    "Screenshot saved: "
                    + destination.toAbsolutePath());

        } catch (IOException e) {

            e.printStackTrace();
        }
    }


    // =====================================================
    // a) SELENIUM BASICS
    // =====================================================

    @Test
    public void testSeleniumBasics() {

        // Open URL
        driver.get(baseUrl + "index.jsp");

        takeScreenshot("01_home_page");

        // Capture URL
        String currentUrl =
                driver.getCurrentUrl();

        System.out.println(
                "Current URL: " + currentUrl);

        // Capture title
        String title =
                driver.getTitle();

        System.out.println(
                "Page Title: " + title);

        // Capture page source
        String source =
                driver.getPageSource();

        System.out.println(
                "Page Source Length: "
                + source.length());

        assertNotNull(currentUrl);
        assertNotNull(title);
        assertNotNull(source);

        // Refresh
        driver.navigate().refresh();

        takeScreenshot("02_after_refresh");

        // Navigate to login
        driver.navigate().to(
                baseUrl + "login.jsp");

        takeScreenshot("03_login_page");

        // Back
        driver.navigate().back();

        // Forward
        driver.navigate().forward();

        takeScreenshot("04_navigation");
    }


    // =====================================================
    // b) WEB ELEMENTS
    // =====================================================

    @Test
    public void testWebElements() {

        driver.get(baseUrl + "login.jsp");

        takeScreenshot("05_login_before_input");

        // findElement()
        WebElement username =
                driver.findElement(
                        By.name("username"));

        // isDisplayed()
        assertTrue(
                username.isDisplayed());

        // isEnabled()
        assertTrue(
                username.isEnabled());

        // sendKeys()
        username.sendKeys("testuser");

        // clear()
        username.clear();

        // sendKeys() again
        username.sendKeys("testuser");

        WebElement password =
                driver.findElement(
                        By.cssSelector(
                                "input[name='password']"));

        password.sendKeys("testpass");

        takeScreenshot("06_login_filled");

        // getAttribute()
        String inputType =
                username.getAttribute("type");

        System.out.println(
                "Username input type: "
                + inputType);

        // getText()
        String pageText =
                driver.findElement(
                        By.tagName("body"))
                        .getText();

        System.out.println(
                "Page Text:");
        System.out.println(pageText);

        // findElements()
        List<WebElement> inputs =
                driver.findElements(
                        By.tagName("input"));

        System.out.println(
                "Number of input elements: "
                + inputs.size());

        assertTrue(
                inputs.size() > 0);

        // isSelected()
        List<WebElement> options =
                driver.findElements(
                        By.cssSelector(
                                "input[type='checkbox'], " +
                                "input[type='radio']"));

        if (!options.isEmpty()) {

            WebElement option =
                    options.get(0);

            System.out.println(
                    "Is selected: "
                    + option.isSelected());
        }

        // click()
        WebElement loginButton =
                driver.findElement(
                        By.xpath(
                                "//button[@type='submit']"));

        assertTrue(
                loginButton.isDisplayed());

        assertTrue(
                loginButton.isEnabled());
    }


    // =====================================================
    // c) LOCATING ELEMENTS
    // =====================================================

    @Test
    public void testLocators() {

        driver.get(baseUrl + "login.jsp");

        takeScreenshot("07_locators_page");

        // ID
        List<WebElement> idElements =
                driver.findElements(
                        By.id("username"));

        // NAME
        List<WebElement> nameElements =
                driver.findElements(
                        By.name("username"));

        // CLASS NAME
        List<WebElement> classElements =
                driver.findElements(
                        By.className("form-control"));

        // LINK TEXT
        List<WebElement> linkElements =
                driver.findElements(
                        By.linkText("Register"));

        // TAG NAME
        List<WebElement> tagElements =
                driver.findElements(
                        By.tagName("input"));

        // CSS SELECTOR
        List<WebElement> cssElements =
                driver.findElements(
                        By.cssSelector(
                                "input[name='password']"));

        // XPATH
        List<WebElement> xpathElements =
                driver.findElements(
                        By.xpath(
                                "//button[@type='submit']"));

        System.out.println(
                "ID elements: "
                + idElements.size());

        System.out.println(
                "Name elements: "
                + nameElements.size());

        System.out.println(
                "Class elements: "
                + classElements.size());

        System.out.println(
                "LinkText elements: "
                + linkElements.size());

        System.out.println(
                "TagName elements: "
                + tagElements.size());

        System.out.println(
                "CSS elements: "
                + cssElements.size());

        System.out.println(
                "XPath elements: "
                + xpathElements.size());
    }


    // =====================================================
    // HOME PAGE
    // =====================================================

    @Test
    public void testHomePageLoads() {

        driver.get(baseUrl + "index.jsp");

        takeScreenshot("08_home_test");

        assertTrue(
                driver.getTitle()
                        .contains("MallMate"));
    }


    // =====================================================
    // REGISTER PAGE
    // =====================================================

    @Test
    public void testRegisterPageNavigation() {

        driver.get(baseUrl + "index.jsp");

        WebElement registerLink =
                driver.findElement(
                        By.linkText("Register"));

        registerLink.click();

        takeScreenshot("09_register_page");

        assertTrue(
                driver.getCurrentUrl()
                        .contains("register.jsp"));
    }


    // =====================================================
    // LOGIN FORM
    // =====================================================

    @Test
    public void testLoginFormElements() {

        driver.get(baseUrl + "login.jsp");

        WebElement username =
                driver.findElement(
                        By.name("username"));

        WebElement password =
                driver.findElement(
                        By.cssSelector(
                                "input[name='password']"));

        WebElement loginBtn =
                driver.findElement(
                        By.xpath(
                                "//button[@type='submit']"));

        username.sendKeys("testuser");

        password.sendKeys("testpass");

        takeScreenshot("10_login_form");

        assertNotNull(loginBtn);
    }


    // =====================================================
    // FLOOR / SHOP NAVIGATION
    // =====================================================

    @Test
    public void testFloorNavigation() {

        driver.get(baseUrl + "index.jsp");

        driver.get(
                baseUrl + "shops?floor=1");

        takeScreenshot("11_shops_page");

        assertTrue(
                driver.getPageSource()
                        .contains("Shops"));
    }


    // =====================================================
    // CLOSE BROWSER
    // =====================================================

    @After
    public void tearDown() {

        if (driver != null) {

            takeScreenshot("12_final_page");

            driver.quit();
        }
    }
}