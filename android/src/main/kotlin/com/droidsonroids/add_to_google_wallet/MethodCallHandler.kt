package com.droidsonroids.add_to_google_wallet

import android.app.Activity
import com.google.android.gms.pay.Pay
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

const val ADD_TO_WALLET_REQUEST_CODE = 1000

internal class MethodCallHandler(private var activity: Activity) : MethodChannel.MethodCallHandler {
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "saveLoyaltyPass") {
            val loyaltyPass = call.argument<String>("loyalty_pass")
            if (loyaltyPass == null) {
                result.error("BadArgument", "Loyalty pass null", null)
            } else {
                val walletClient = Pay.getClient(activity)
                walletClient.savePasses(loyaltyPass, activity, ADD_TO_WALLET_REQUEST_CODE)
            }
        } else {
            result.notImplemented()
        }
    }
}
