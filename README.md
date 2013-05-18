Banner and Algorithmic Period Budgeting
=======================================

Views
-----

### RZVPBGP

The RZVPBGP view assists in the creation of period budget group assignment rules by providing a consistent view of the appropriate student data. It provides one record per period in the student's aid period for a given aid year. The view handles determining which student data to gather for any given period. If the student has an Admissions record for the given term, data from that Admissions record is used. If the student has both a Student record and an Admissions record for any term term in the Aid Year, the view will use data from whichever record has most recent term code. If the student is missing either a Student record or an Admissions record, the other will be used.

The RZVPBGP contains the folowing fields:

- Student's PIDM
- Aid Year Code
- Aid Period Code
- Period Code
- Term Code (The term code associated with the student module for the period)
- Term Start Date
- Module (Either 'A' for Admissions or 'S' for Student depending on which record is used for the period.)
- Term Code of the Record (May be earlier than the term code associate with the period)
- Level Code
- Student Type Code
- Primary Major Code
- Admit Code
- Latest Decision Code
- Student Status Code
- Class Code
- Billing Hours
- Housing Code

Packages
--------

### MC_FA_UTIL

The MC_FA_UTIL package contains the following helper functions used in the RZVPBGP view.

#### get_decision()

Returns the latest decision code for an Admissions application.

#### get_stu_rec()

Returns the ROWID of the effective student record.

#### get_adm_rec()

Returns the ROWID of the Admissions application for a given term

#### get_aidy_adm_rec()

Returns the ROWID of the most recent Admissions application for a given Aid Year.

###  MC_FA_BUDGET

The MC_FA_BUDGET package contains helper functions used in Algorithmic budget rules. Most of the functions look up information from RORALGS.

#### get_art_fee()

Return the art fee amount from RORALGS. Accepts Aid Year Code and Budget Type Code as parameters.

#### get_nursing_fee()

Return the nursing fee amount from RORALGS. Accepts Aid Year Code, Budget Type Code, and Class Code as parameters.

#### get_music_fee()

Return the music fee amount from RORALGS. Accepts Aid Year Code and Budget Type Code as parameters.

#### get_loan_fees()

Return the loan fees amount from RORALGS. Accepts Aid Year Code and Budget Type Code as parameters.

#### get_grad_tuition_rate()

Return the graduate tuition rate per hour from RORALGS. Accepts Aid Year Code and Tuition Group as parameters.

#### get_grad_tech_fee()

Return the graduate technology fee from RORALGS. Accepts Aid Year Code as a parameter.

#### get_grad_room_standard()

Return the graduate room amount for standard courses from RORALGS. Accepts Aid Year Code and Billing Hours as parameters.

#### get_grad_board_standard()

Return the graduate board amount for standard courses from RORALGS. Accepts Aid Year Code and Billing Hours as parameters.

#### get_grad_books()

Return the graduate books allowance from RORALGS. Accepts Aid Year Code as a parameter.

#### get_grad_travel()

Return the graduate travel allowance from RORALGS. Accepts Aid Year Code and Billing Hours as parameters.

#### get_grad_pers()

Return the graduate personal allowance from RORALGS. Accepts Aid Year Code and Billing Hours as parameters.

#### get_grad_intensive_room()

Return the graduate room amount for intensive courses from RORALGS. Accepts Aid Year Code and Billing Hours as parameters.

#### get_grad_intensive_board()

Return the graduate board amount for intensive courses from RORALGS. Accepts Aid Year Code and Billing Hours as parameters.

#### get_ug_pt_tuit()

Return the undergraduate part-time tuition rate from RORALGS. Accepts Aid Year Code as a parameter.

#### get_ut_ov_tuit()

Return the undergraduate overloaded tuition rate from RORALGS. Accepts Aid Year Code as a parameter.