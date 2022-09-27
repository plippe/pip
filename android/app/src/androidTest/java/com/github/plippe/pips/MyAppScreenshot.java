package com.github.plippe.pips;

import androidx.test.ext.junit.rules.ActivityScenarioRule;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import tools.fastlane.screengrab.Screengrab;

import static androidx.test.espresso.assertion.ViewAssertions.matches;
import static androidx.test.espresso.matcher.ViewMatchers.isDisplayed;
import static androidx.test.espresso.matcher.ViewMatchers.isRoot;
import static androidx.test.espresso.Espresso.onView;

@RunWith(JUnit4.class)
public class MyAppScreenshot {
    @Rule
    public ActivityScenarioRule activityRule = new ActivityScenarioRule<>(MainActivity.class);

    @Test
    public void testTakeScreenshot0() {
        onView(isRoot()).check(matches(isDisplayed()));
        Screengrab.screenshot("GameWidget");
    }

    @Test
    public void testTakeScreenshot1() {
        onView(isRoot()).check(matches(isDisplayed()));
        Screengrab.screenshot("GameWidget");
    }

    @Test
    public void testTakeScreenshot2() {
        onView(isRoot()).check(matches(isDisplayed()));
        Screengrab.screenshot("GameWidget");
    }

    @Test
    public void testTakeScreenshot3() {
        onView(isRoot()).check(matches(isDisplayed()));
        Screengrab.screenshot("GameWidget");
    }

    @Test
    public void testTakeScreenshot4() {
        onView(isRoot()).check(matches(isDisplayed()));
        Screengrab.screenshot("GameWidget");
    }
}
