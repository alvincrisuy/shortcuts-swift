import XCTest
import ShortcutsSwift

class ShortcutsSwiftTests: XCTestCase {
    /// Tests that the battery level example compiles.
    func testBatteryExample() {
        let batteryLevel = actionOutput()
        _ = buildShortcut(
            comment("This Shortcut was generated in Swift.") +
            getBatteryLevel().savingOutput(to: batteryLevel) +
            ifLessThan(20, ifTrue: (
            setLowPowerMode(true) +
                showResult("Your battery is at \(batteryLevel)%, you might want to charge it.")
            ), ifFalse: (
                showResult("Your battery is at \(batteryLevel)%, you're probably fine for now.")
            ))
        )
    }

    /// Tests that the clap along example compiles.
    func testClapAlong() {
        _ = buildShortcut(
            comment("This Shortcut was generated in Swift.") +
            ask(question: "WHAT 👏 DO 👏 YOU 👏 WANT 👏 TO 👏 SAY") +
            changeCase(to: .uppercase) +
            replaceText("[\\s]", replaceWith: " 👏 ", regularExpression: true) +
            chooseFromMenu(items: [
                ("Share", share()),
                ("Copy to Clipboard", copyToClipboard()),
            ])
        )
    }

    func testDictionaryAggrandizements() {
        let dictionaryVariable = actionOutput()
        _ = buildShortcut(
            dictionary(["number": 42]).savingOutput(to: dictionaryVariable) +
            showResult("\(dictionaryVariable.with(valueForKey: "number"))")
        )
    }
}
