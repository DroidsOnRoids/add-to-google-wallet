package com.droidsonroids.add_to_google_wallet

import android.app.Activity
import com.google.android.gms.pay.Pay
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

const val addToGoogleWallet = 1000

internal class MethodCallHandler(private var activity: Activity) : MethodChannel.MethodCallHandler {
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "saveLoyaltyPass") {
            val loyaltyPass = call.argument<String>("loyalty_pass")
            if (loyaltyPass == null) {
                result.error("BadArgument", "BadArgument", null)
            } else {
                val walletClient = Pay.getClient(activity)
                walletClient.savePasses(loyaltyPass, activity, addToGoogleWallet)
            }
        } else {
            result.notImplemented()
        }
    }
}
