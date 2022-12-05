package com.droidsonroids.add_to_google_wallet

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodChannel

class AddToGoogleWalletPlugin : FlutterPlugin, ActivityAware {
    private lateinit var methodChannel: MethodChannel
    private lateinit var savePass: SavePass
    private lateinit var manager: SavePassSuccessManager

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        methodChannel = MethodChannel(binding.binaryMessenger, CHANNEL)
        manager = SavePassSuccessManager(methodChannel)
        savePass = SavePass(activity = null)
        val handler = MethodCallHandler(savePass)
        methodChannel.setMethodCallHandler(handler)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        methodChannel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        binding.addActivityResultListener(manager)
        savePass.setActivity(binding.activity)
    }


    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
        savePass.setActivity(null)
    }

    companion object {
        private const val CHANNEL = "com.droidsonroids/loyalty_pass"
    }
}