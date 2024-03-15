*&---------------------------------------------------------------------*
*& Report ZMG_TEST_25
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_25.

"Success Message (Basari Mesaji)
*DATA: gv_number_01 TYPE n LENGTH 2.
*DATA: gv_number_02 TYPE n LENGTH 2.
*
*gv_number_01 = 70.
*
*IF gv_number_01 > 50.
*  gv_number_02 = gv_number_01 + 10.
*  WRITE:'Numara-2' ,gv_number_02.
*  MESSAGE 'Toplama işlemi başar ile gerçekleşti.' TYPE 'S'.
*ENDIF.

"-  Information Message (Bilgilendirme Mesajı)
*DATA: gv_number TYPE n LENGTH 2.
*gv_number = 20.
*IF gv_number > 50.
*  MESSAGE 'Girdiğiniz sayı 50''den büyüktür.' TYPE 'I'.
*  ELSEIF gv_number = 50.
*    MESSAGE 'Girdiğiniz sayı 50''ye eşittir.' TYPE 'I'.
*    ELSE.
*      MESSAGE 'Girdiğiniz sayı 50''den küçüktür.' TYPE 'I'.
*ENDIF.

*PARAMETERS: p_txt_01 TYPE c LENGTH 10.
*PARAMETERS: p_txt_02 TYPE c LENGTH 10.
*PARAMETERS: p_txt_03 TYPE c LENGTH 10.
*
*DATA: gv_text TYPE c LENGTH 10.
*
*gv_text = p_txt_01.
*MESSAGE gv_text TYPE 'I'.
*CLEAR: gv_text.
*
*gv_text = p_txt_02.
*MESSAGE gv_text TYPE 'I'.
*CLEAR: gv_text.
*
*gv_text = p_txt_03.
*MESSAGE gv_text TYPE 'I'.
*CLEAR: gv_text.
******************************************************************
"Error Message (Hata Mesajı):
*PARAMETERS: p_num1 TYPE i.
*PARAMETERS: p_num2 TYPE i.
*
*DATA: gv_result TYPE i.
*
*IF p_num1 = 0 AND p_num2 = 0.
*  MESSAGE 'Lütfen alanları doldurunuz' TYPE 'S' DISPLAY LIKE 'E'.
*
*ENDIF.
*
*gv_result = p_num1 + p_num2.
*WRITE: 'Sonuç : ',gv_result.


"Warning Message (Uyari Mesaji):

*PARAMETERS: p_num1 TYPE i.
*PARAMETERS: p_num2 TYPE i.
*
*DATA: gv_result TYPE i.
*
*IF p_num1 = 0 AND p_num2 = 0.
*  MESSAGE 'Lütfen alanları doldurunuz' TYPE 'S' DISPLAY LIKE 'W'.
*
*ENDIF.
*
*gv_result = p_num1 + p_num2.
*WRITE: 'Sonuç : ',gv_result.

"Abort Message (Iptal Mesaji)
*PARAMETERS: p_name TYPE c LENGTH 20.
*PARAMETERS: p_sname TYPE c LENGTH 20.
*
*DATA: gv_fullname TYPE c LENGTH 40.
*IF p_name IS INITIAL AND p_sname IS INITIAL.
*  MESSAGE 'Lütfen her iki alanı da doldurunuz.' TYPE 'A'.
*ENDIF.
*
*CONCATENATE p_name p_sname INTO gv_fullname SEPARATED BY space.
*WRITE: 'İsim :', gv_fullname.

"Exit Message (Cikis mesaji)
PARAMETERS: p_num1 TYPE i.
PARAMETERS: p_num2 TYPE i.

DATA: gv_result TYPE i.

IF p_num2 = 0.
  MESSAGE 'Yapılması imkansız işlem talebi ile karşılaşıldı.' TYPE 'X'.
ENDIF.

gv_result = p_num1 / p_num2.
WRITE: 'Sonuç :', gv_result.
