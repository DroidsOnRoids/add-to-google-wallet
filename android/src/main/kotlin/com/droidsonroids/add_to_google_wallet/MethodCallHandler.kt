package com.droidsonroids.add_to_google_wallet

import android.app.Activity
import com.google.android.gms.pay.Pay
import com.google.android.gms.pay.PayApiAvailabilityStatus
import com.google.android.gms.pay.PayClient
import com.google.android.gms.tasks.Task
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

const val ADD_TO_WALLET_REQUEST_CODE = 1000

internal class MethodCallHandler(private var activity: Activity) : MethodChannel.MethodCallHandler {
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "saveLoyaltyPass" -> {
                val loyaltyPass = call.argument<String>("loyalty_pass")
                if (loyaltyPass == null) {
                    result.error("BadArgument", "Loyalty pass null", null)
                } else {
                    val walletClient = Pay.getClient(activity)
                    walletClient.savePasses(loyaltyPass, activity, ADD_TO_WALLET_REQUEST_CODE)
                }
            }
            "isGoogleWalletApiAvailable" -> {
                val walletClient = Pay.getClient(activity)
                walletClient
                    .getPayApiAvailabilityStatus(PayClient.RequestType.SAVE_PASSES)
                    .addOnSuccessListener { status ->
                        result.success(status == PayApiAvailabilityStatus.AVAILABLE)
                    }
                    .addOnFailureListener { e ->
                        result.error("Error", e.message, null)
                    }
            }
            else -> {
                result.notImplemented()
            }
        }
    }
}
