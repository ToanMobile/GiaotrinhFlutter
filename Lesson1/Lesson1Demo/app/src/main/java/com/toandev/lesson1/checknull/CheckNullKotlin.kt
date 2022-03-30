package com.toandev.lesson1.checknull

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/
@Suppress("unused")
class CheckNullKotlin {
    private val listData: MutableList<String>? = null
    private val text: String? = null

    fun doSomething(): String {
        return listData?.run {
            listData.add(text ?: "List is Null")
            listData[0]
        } ?: run { "List is Null" }
    }
}