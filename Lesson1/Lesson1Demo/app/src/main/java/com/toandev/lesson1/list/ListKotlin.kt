package com.toandev.lesson1.list

import android.util.Log
import java.util.*

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/
class ListKotlin {
    fun doSomething() {
        val listData: MutableList<Int?> = mutableListOf()
        for (i in 0..99) {
            listData.add(i)
        }
        val newList = listData.filter { listMoi -> (listMoi!! % 10 == 0) }
        Log.e("newListKotlin==", newList.map { it }.toString())
    }
}