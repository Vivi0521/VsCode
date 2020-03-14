//身分證字號或外籍人士居留証驗證
/*
 * 第一個字元代表地區，轉換方式為：A轉換成1,0兩個字元，B轉換成1,1……但是Z、I、O分別轉換為33、34、35
 * 第二個字元代表性別，1代表男性，2代表女性
 * 第三個字元到第九個字元為流水號碼。
 * 第十個字元為檢查號碼。
 * 每個相對應的數字相乘，如A123456789代表1、0、1、2、3、4、5、6、7、8，相對應乘上1987654321，再相加。
 * 相加後的值除以模數，也就是10，取餘數再以模數10減去餘數，若等於檢查碼，則驗證通過
 */

//清除空白
function removeAllSpace(str) {
    return str.replace(/\s+/g, "");
}
function trim(str) {
    return str.replace(/(^\s+)|(\s+$)/g, "");
}

function checkID(idNumber) {
    var result = false; 
    var studIdNumber = idNumber.toUpperCase();
   var i = 0; 
    //第二碼為英文字 = 居留證
    if (/^[A-Z]$/.test(studIdNumber.substr(1, 1))) {
        i = 1
    }
    result = studIdNumberIdentify(i, idNumber); 
    return result; 
}

function studIdNumberIdentify(nationality, idNumber) {

    studIdNumber = idNumber.toUpperCase();

    //本國人
    if (nationality == 0) {

        //驗證填入身分證字號長度及格式
        if (studIdNumber.length != 10) {
            alert("長度不足");
            return false;
        }
        //格式，用正則表示式比對第一個字母是否為英文字母
        if (isNaN(studIdNumber.substr(1, 9)) ||
            (!/^[A-Z]$/.test(studIdNumber.substr(0, 1)))) {
            alert("格式錯誤");
            return false;
        }

        var idHeader = "ABCDEFGHJKLMNPQRSTUVXYWZIO"; //按照轉換後權數的大小進行排序
        //這邊把身分證字號轉換成準備要對應的
        studIdNumber = (idHeader.indexOf(studIdNumber.substring(0, 1)) + 10) + '' + studIdNumber.substr(1, 9);
        //開始進行身分證數字的相乘與累加，依照順序乘上1987654321
        s = parseInt(studIdNumber.substr(0, 1)) +
            parseInt(studIdNumber.substr(1, 1)) * 9 +
            parseInt(studIdNumber.substr(2, 1)) * 8 +
            parseInt(studIdNumber.substr(3, 1)) * 7 +
            parseInt(studIdNumber.substr(4, 1)) * 6 +
            parseInt(studIdNumber.substr(5, 1)) * 5 +
            parseInt(studIdNumber.substr(6, 1)) * 4 +
            parseInt(studIdNumber.substr(7, 1)) * 3 +
            parseInt(studIdNumber.substr(8, 1)) * 2 +
            parseInt(studIdNumber.substr(9, 1));

        checkNum = parseInt(studIdNumber.substr(10, 1));
        //模數 - 總和/模數(10)之餘數若等於第九碼的檢查碼，則驗證成功
        //若餘數為0，檢查碼就是0
        if ((s % 10) == 0 || (10 - s % 10) == checkNum) {
            return true;
        }
        else {
            return false;
        }

    }
    //外籍生，居留證號規則跟身分證號差不多，只是第二碼也是英文字母代表性別，跟第一碼轉換二位數字規則相同，但只取餘數
    else {

        //驗證填入身分證字號長度及格式
        if (studIdNumber.length != 10) {
            alert("長度不足");
            return false;
        }
        //格式，用正則表示式比對第一個字母是否為英文字母
        if (isNaN(studIdNumber.substr(2, 8)) ||
            (!/^[A-Z]$/.test(studIdNumber.substr(0, 1))) ||
            (!/^[A-Z]$/.test(studIdNumber.substr(1, 1)))) {
            alert("格式錯誤");
            return false;
        }

        var idHeader = "ABCDEFGHJKLMNPQRSTUVXYWZIO"; //按照轉換後權數的大小進行排序
        //這邊把身分證字號轉換成準備要對應的
        studIdNumber = (idHeader.indexOf(studIdNumber.substring(0, 1)) + 10) +
            '' + ((idHeader.indexOf(studIdNumber.substr(1, 1)) + 10) % 10) + '' + studIdNumber.substr(2, 8);
        //開始進行身分證數字的相乘與累加，依照順序乘上1987654321

        s = parseInt(studIdNumber.substr(0, 1)) +
            parseInt(studIdNumber.substr(1, 1)) * 9 +
            parseInt(studIdNumber.substr(2, 1)) * 8 +
            parseInt(studIdNumber.substr(3, 1)) * 7 +
            parseInt(studIdNumber.substr(4, 1)) * 6 +
            parseInt(studIdNumber.substr(5, 1)) * 5 +
            parseInt(studIdNumber.substr(6, 1)) * 4 +
            parseInt(studIdNumber.substr(7, 1)) * 3 +
            parseInt(studIdNumber.substr(8, 1)) * 2 +
            parseInt(studIdNumber.substr(9, 1));

        //檢查號碼 = 10 - 相乘後個位數相加總和之尾數。
        checkNum = parseInt(studIdNumber.substr(10, 1));
        //模數 - 總和/模數(10)之餘數若等於第九碼的檢查碼，則驗證成功
        ///若餘數為0，檢查碼就是0
        if ((s % 10) == 0 || (10 - s % 10) == checkNum) {
            return true;
        }
        else {
            return false;
        }

    }

}


function plusXing(str, frontLen, endLen) {
    var len = str.length - frontLen - endLen;
    var xing = '';
    for (var i = 0; i < len; i++) {
        xing += 'Ｏ';
    }
    return str.substring(0, frontLen) + xing + str.substring(str.length - endLen);
}
