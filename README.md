# a simple metronome realized by verilog
## environment : STEP; compile platform : vivado

## function : it can function as metronome in certain frequency. 
- frequency can adjust by the buttons, up and down change frequency by 10; left and right change frequency by 1
-	the button in the middle is reset button.
- the rhythm is controled by switches, one cycle is divided into 16, and if the k-th switch is on, buzzer will ring in the k-th part. For example: if SW[0] , SW[4], SW[8] and SW[12] is on, metronome will play four quarter note every cycle.
- if not switch is on, metronome will stop.

## 功能 ： 特定频率的节拍器
- 频率通过按钮调节，上下按钮增减10，左右按钮增减1
- 中间按钮为复位按钮
- 节奏通过开关调节，每个周期分为16份，如果第k个开关开启，蜂鸣器将在第k份响起。如开启SW[0], SW[4], SW[8] 和SW[12]，节拍器的节奏为每周期四个4分音符。
- 节拍器暂停：所有开关为off状态。

### example constrs file is in the project, different environment need to change your constrs file to fit the project
