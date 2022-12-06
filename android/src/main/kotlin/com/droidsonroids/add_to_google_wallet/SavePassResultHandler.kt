package com.droidsonroids.add_to_google_wallet

import android.app.Activity
import android.content.*
import com.google.android.gms.pay.PayClient
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry.ActivityResultListener

internal class SavePassResultHandler(private val channel: MethodChannel) : ActivityResultListener {
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        return if (requestCode == addToGoogleWallet) {
            handlePassResult(resultCode, data)
            true
        } else {
            false
        }
    }

    private fun handlePassResult(resultCode: Int, data: Intent?) {
        when (resultCode) {
            Activity.RESULT_OK -> channel.invokeMethod("onSuccess", null)
            Activity.RESULT_CANCELED -> channel.invokeMethod("onCanceled", null)
            PayClient.SavePassesResult.SAVE_ERROR -> {
                val errorMessage = data?.getStringExtra(PayClient.EXTRA_API_ERROR_MESSAGE)
                channel.invokeMethod(
                    "onError",
                    mapOf("message" to (errorMessage ?: "Unexpected"))
                )
            }
            PayClient.SavePassesResult.INTERNAL_ERROR -> {
                channel.invokeMethod("onError", mapOf("message" to "Internal error"))
            }
        }
    }
}
