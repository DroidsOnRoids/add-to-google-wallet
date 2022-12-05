package com.droidsonroids.add_to_google_wallet

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

internal class MethodCallHandler(private val savePass: SavePass) : MethodChannel.MethodCallHandler {

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "saveLoyaltyPass") {
            val loyaltyPass = call.argument<String>("loyalty_pass")
            if (loyaltyPass == null) {
                result.error("BadArgument", "Loyalty pass null", null)
            } else {
                savePass.saveLoyaltyPass(loyaltyPass)
            }
        } else {
            result.notImplemented()
        }
    }
}