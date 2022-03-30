package com.toandev.lesson1.broadcast

import android.annotation.SuppressLint
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.BatteryManager
import android.util.Log
import java.util.logging.Logger

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

class BatteryLevelReceiver: BroadcastReceiver() {
    @SuppressLint("LongLogTag")
    override fun onReceive(context: Context?, intent: Intent?) {
        context!!.unregisterReceiver(this)
        val rawlevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1)
        val scale = intent!!.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        var level = -1
        if (rawlevel >= 0 && scale > 0) {
            level = rawlevel * 100 / scale
        }
        Log.e("Battery Level Remaining=", "$level%")
    }
}