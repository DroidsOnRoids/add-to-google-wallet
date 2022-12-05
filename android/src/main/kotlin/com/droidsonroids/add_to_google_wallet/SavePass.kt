package com.droidsonroids.add_to_google_wallet

import android.util.Log
import com.google.android.gms.pay.Pay
import com.google.android.gms.pay.PayClient
import android.app.Activity

internal class SavePass(private var activity: Activity?) {
    private val saveToGooglePay = 1000
    private lateinit var walletClient: PayClient

    fun saveLoyaltyPass(loyaltyCard: String) {
        if (activity != null) {
            walletClient = Pay.getClient(activity!!)
            walletClient.savePasses(loyaltyCard, activity!!, saveToGooglePay)
        } else {
            //throw error
        }
    }

    fun setActivity(activity: Activity?) {
        this.activity = activity
    }

}