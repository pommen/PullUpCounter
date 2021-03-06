EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Peters:Hc-SR04 U1
U 1 1 5B82E831
P 2100 3950
F 0 "U1" H 2227 4001 50  0000 L CNN
F 1 "Hc-SR04" H 2227 3910 50  0000 L CNN
F 2 "Libs:HC-SR04" H 2050 4100 50  0001 C CNN
F 3 "" H 2050 4100 50  0001 C CNN
	1    2100 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5B82E93E
P 2100 3300
F 0 "C1" H 2215 3346 50  0000 L CNN
F 1 "100n" H 2215 3255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2138 3150 50  0001 C CNN
F 3 "~" H 2100 3300 50  0001 C CNN
	1    2100 3300
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0101
U 1 1 5B82E9CD
P 2100 3150
F 0 "#PWR0101" H 2100 3000 50  0001 C CNN
F 1 "VCC" H 2117 3323 50  0000 C CNN
F 2 "" H 2100 3150 50  0001 C CNN
F 3 "" H 2100 3150 50  0001 C CNN
	1    2100 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5B82EA1D
P 2100 3450
F 0 "#PWR0102" H 2100 3200 50  0001 C CNN
F 1 "GND" H 2105 3277 50  0000 C CNN
F 2 "" H 2100 3450 50  0001 C CNN
F 3 "" H 2100 3450 50  0001 C CNN
	1    2100 3450
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0103
U 1 1 5B82EA7C
P 1750 3800
F 0 "#PWR0103" H 1750 3650 50  0001 C CNN
F 1 "VCC" H 1767 3973 50  0000 C CNN
F 2 "" H 1750 3800 50  0001 C CNN
F 3 "" H 1750 3800 50  0001 C CNN
	1    1750 3800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5B82EA8B
P 1750 4100
F 0 "#PWR0104" H 1750 3850 50  0001 C CNN
F 1 "GND" H 1755 3927 50  0000 C CNN
F 2 "" H 1750 4100 50  0001 C CNN
F 3 "" H 1750 4100 50  0001 C CNN
	1    1750 4100
	1    0    0    -1  
$EndComp
$Comp
L Peters:DS92LV010A U2
U 1 1 5B82EAE9
P 4900 2600
F 0 "U2" H 4875 2775 50  0000 C CNN
F 1 "DS92LV010A" H 4875 2684 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 4500 3000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ds92lv010a.pdf" H 4400 3100 50  0001 C CNN
	1    4900 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5B82EBBB
P 4600 2100
F 0 "C2" H 4715 2146 50  0000 L CNN
F 1 "100n" H 4715 2055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4638 1950 50  0001 C CNN
F 3 "~" H 4600 2100 50  0001 C CNN
	1    4600 2100
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0105
U 1 1 5B82EBC1
P 4600 1950
F 0 "#PWR0105" H 4600 1800 50  0001 C CNN
F 1 "VCC" H 4617 2123 50  0000 C CNN
F 2 "" H 4600 1950 50  0001 C CNN
F 3 "" H 4600 1950 50  0001 C CNN
	1    4600 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5B82EBC7
P 4600 2250
F 0 "#PWR0106" H 4600 2000 50  0001 C CNN
F 1 "GND" H 4605 2077 50  0000 C CNN
F 2 "" H 4600 2250 50  0001 C CNN
F 3 "" H 4600 2250 50  0001 C CNN
	1    4600 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5B82EBFE
P 5100 2100
F 0 "C4" H 5215 2146 50  0000 L CNN
F 1 "10n" H 5215 2055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5138 1950 50  0001 C CNN
F 3 "~" H 5100 2100 50  0001 C CNN
	1    5100 2100
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0107
U 1 1 5B82EC04
P 5100 1950
F 0 "#PWR0107" H 5100 1800 50  0001 C CNN
F 1 "VCC" H 5117 2123 50  0000 C CNN
F 2 "" H 5100 1950 50  0001 C CNN
F 3 "" H 5100 1950 50  0001 C CNN
	1    5100 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5B82EC0A
P 5100 2250
F 0 "#PWR0108" H 5100 2000 50  0001 C CNN
F 1 "GND" H 5105 2077 50  0000 C CNN
F 2 "" H 5100 2250 50  0001 C CNN
F 3 "" H 5100 2250 50  0001 C CNN
	1    5100 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5B82ECBB
P 4650 3900
F 0 "C3" H 4765 3946 50  0000 L CNN
F 1 "100n" H 4765 3855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4688 3750 50  0001 C CNN
F 3 "~" H 4650 3900 50  0001 C CNN
	1    4650 3900
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0109
U 1 1 5B82ECC1
P 4650 3750
F 0 "#PWR0109" H 4650 3600 50  0001 C CNN
F 1 "VCC" H 4667 3923 50  0000 C CNN
F 2 "" H 4650 3750 50  0001 C CNN
F 3 "" H 4650 3750 50  0001 C CNN
	1    4650 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5B82ECC7
P 4650 4050
F 0 "#PWR0110" H 4650 3800 50  0001 C CNN
F 1 "GND" H 4655 3877 50  0000 C CNN
F 2 "" H 4650 4050 50  0001 C CNN
F 3 "" H 4650 4050 50  0001 C CNN
	1    4650 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5B82ECCD
P 5150 3900
F 0 "C5" H 5265 3946 50  0000 L CNN
F 1 "10n" H 5265 3855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5188 3750 50  0001 C CNN
F 3 "~" H 5150 3900 50  0001 C CNN
	1    5150 3900
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0111
U 1 1 5B82ECD3
P 5150 3750
F 0 "#PWR0111" H 5150 3600 50  0001 C CNN
F 1 "VCC" H 5167 3923 50  0000 C CNN
F 2 "" H 5150 3750 50  0001 C CNN
F 3 "" H 5150 3750 50  0001 C CNN
	1    5150 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 5B82ECD9
P 5150 4050
F 0 "#PWR0112" H 5150 3800 50  0001 C CNN
F 1 "GND" H 5155 3877 50  0000 C CNN
F 2 "" H 5150 4050 50  0001 C CNN
F 3 "" H 5150 4050 50  0001 C CNN
	1    5150 4050
	1    0    0    -1  
$EndComp
$Comp
L Peters:DS92LV010A U3
U 1 1 5B82ECE6
P 4900 4350
F 0 "U3" H 4875 4525 50  0000 C CNN
F 1 "DS92LV010A" H 4875 4434 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 4500 4750 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ds92lv010a.pdf" H 4400 4850 50  0001 C CNN
	1    4900 4350
	1    0    0    -1  
$EndComp
Text GLabel 1750 3900 0    50   Input ~ 0
TRIG
Text GLabel 1750 4000 0    50   Input ~ 0
ECHO
Text GLabel 7750 2750 0    50   Input ~ 0
TRIG+
Text GLabel 7750 2850 0    50   Input ~ 0
TRIG-
$Comp
L power:+12V #PWR0114
U 1 1 5B82F9E9
P 7750 2950
F 0 "#PWR0114" H 7750 2800 50  0001 C CNN
F 1 "+12V" V 7765 3078 50  0000 L CNN
F 2 "" H 7750 2950 50  0001 C CNN
F 3 "" H 7750 2950 50  0001 C CNN
	1    7750 2950
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR0115
U 1 1 5B82FA28
P 7750 3150
F 0 "#PWR0115" H 7750 3000 50  0001 C CNN
F 1 "+12V" V 7765 3278 50  0000 L CNN
F 2 "" H 7750 3150 50  0001 C CNN
F 3 "" H 7750 3150 50  0001 C CNN
	1    7750 3150
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5B82FA45
P 7750 3050
F 0 "#PWR0116" H 7750 2800 50  0001 C CNN
F 1 "GND" V 7755 2922 50  0000 R CNN
F 2 "" H 7750 3050 50  0001 C CNN
F 3 "" H 7750 3050 50  0001 C CNN
	1    7750 3050
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 5B82FA7D
P 7750 3250
F 0 "#PWR0117" H 7750 3000 50  0001 C CNN
F 1 "GND" V 7755 3122 50  0000 R CNN
F 2 "" H 7750 3250 50  0001 C CNN
F 3 "" H 7750 3250 50  0001 C CNN
	1    7750 3250
	0    1    -1   0   
$EndComp
Text GLabel 7750 3450 0    50   Input ~ 0
ECHO+
Text GLabel 7750 3350 0    50   Input ~ 0
ECHO-
$Comp
L Device:C C6
U 1 1 5B82FF7A
P 7450 4350
F 0 "C6" H 7565 4396 50  0000 L CNN
F 1 "100n" H 7565 4305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7488 4200 50  0001 C CNN
F 3 "~" H 7450 4350 50  0001 C CNN
	1    7450 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 5B82FF86
P 7450 4500
F 0 "#PWR0118" H 7450 4250 50  0001 C CNN
F 1 "GND" H 7455 4327 50  0000 C CNN
F 2 "" H 7450 4500 50  0001 C CNN
F 3 "" H 7450 4500 50  0001 C CNN
	1    7450 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5B82FFD3
P 8700 4350
F 0 "C7" H 8815 4396 50  0000 L CNN
F 1 "1u" H 8815 4305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8738 4200 50  0001 C CNN
F 3 "~" H 8700 4350 50  0001 C CNN
	1    8700 4350
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0119
U 1 1 5B82FFD9
P 8700 4000
F 0 "#PWR0119" H 8700 3850 50  0001 C CNN
F 1 "VCC" H 8717 4173 50  0000 C CNN
F 2 "" H 8700 4000 50  0001 C CNN
F 3 "" H 8700 4000 50  0001 C CNN
	1    8700 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 5B82FFDF
P 8700 4550
F 0 "#PWR0120" H 8700 4300 50  0001 C CNN
F 1 "GND" H 8705 4377 50  0000 C CNN
F 2 "" H 8700 4550 50  0001 C CNN
F 3 "" H 8700 4550 50  0001 C CNN
	1    8700 4550
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0121
U 1 1 5B8300FD
P 7450 4050
F 0 "#PWR0121" H 7450 3900 50  0001 C CNN
F 1 "+12V" H 7465 4223 50  0000 C CNN
F 2 "" H 7450 4050 50  0001 C CNN
F 3 "" H 7450 4050 50  0001 C CNN
	1    7450 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 4050 7450 4200
Wire Wire Line
	7700 4200 7450 4200
Connection ~ 7450 4200
Wire Wire Line
	8700 4000 8700 4200
Connection ~ 8700 4200
$Comp
L power:GND #PWR0122
U 1 1 5B830554
P 8000 4500
F 0 "#PWR0122" H 8000 4250 50  0001 C CNN
F 1 "GND" H 8005 4327 50  0000 C CNN
F 2 "" H 8000 4500 50  0001 C CNN
F 3 "" H 8000 4500 50  0001 C CNN
	1    8000 4500
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM2937xMP U4
U 1 1 5B830684
P 8000 4200
F 0 "U4" H 8000 4442 50  0000 C CNN
F 1 "LM2937xMP" H 8000 4351 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 8000 4425 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm2937.pdf" H 8000 4150 50  0001 C CNN
	1    8000 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 4200 8700 4200
$Comp
L Device:CP C9
U 1 1 5B830884
P 9150 4350
F 0 "C9" H 9268 4396 50  0000 L CNN
F 1 "15u" H 9268 4305 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3528-12_Kemet-T_Pad1.50x2.35mm_HandSolder" H 9188 4200 50  0001 C CNN
F 3 "~" H 9150 4350 50  0001 C CNN
	1    9150 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 4500 8700 4550
Wire Wire Line
	8700 4500 9150 4500
Connection ~ 8700 4500
Wire Wire Line
	8700 4200 9150 4200
$Comp
L power:VCC #PWR0123
U 1 1 5B830ACB
P 4350 2650
F 0 "#PWR0123" H 4350 2500 50  0001 C CNN
F 1 "VCC" H 4367 2823 50  0000 C CNN
F 2 "" H 4350 2650 50  0001 C CNN
F 3 "" H 4350 2650 50  0001 C CNN
	1    4350 2650
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0124
U 1 1 5B830AF0
P 4300 4350
F 0 "#PWR0124" H 4300 4200 50  0001 C CNN
F 1 "VCC" H 4317 4523 50  0000 C CNN
F 2 "" H 4300 4350 50  0001 C CNN
F 3 "" H 4300 4350 50  0001 C CNN
	1    4300 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 5B830B70
P 5400 4900
F 0 "#PWR0125" H 5400 4650 50  0001 C CNN
F 1 "GND" H 5405 4727 50  0000 C CNN
F 2 "" H 5400 4900 50  0001 C CNN
F 3 "" H 5400 4900 50  0001 C CNN
	1    5400 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0126
U 1 1 5B830B95
P 5400 3150
F 0 "#PWR0126" H 5400 2900 50  0001 C CNN
F 1 "GND" H 5405 2977 50  0000 C CNN
F 2 "" H 5400 3150 50  0001 C CNN
F 3 "" H 5400 3150 50  0001 C CNN
	1    5400 3150
	1    0    0    -1  
$EndComp
Text GLabel 5700 2650 2    50   Input ~ 0
TRIG+
Text GLabel 5700 2950 2    50   Input ~ 0
TRIG-
Text GLabel 5750 4700 2    50   Input ~ 0
ECHO-
Text GLabel 5750 4400 2    50   Input ~ 0
ECHO+
NoConn ~ 4350 2900
NoConn ~ 4350 2750
$Comp
L power:GND #PWR0127
U 1 1 5B830D73
P 4350 3150
F 0 "#PWR0127" H 4350 2900 50  0001 C CNN
F 1 "GND" H 4355 2977 50  0000 C CNN
F 2 "" H 4350 3150 50  0001 C CNN
F 3 "" H 4350 3150 50  0001 C CNN
	1    4350 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 2650 5500 2650
Wire Wire Line
	5700 2950 5500 2950
Text GLabel 3900 3000 0    50   Input ~ 0
TRIG
Wire Wire Line
	4350 3000 3950 3000
NoConn ~ 4350 4900
NoConn ~ 4350 4750
Wire Wire Line
	4350 4400 4300 4400
Wire Wire Line
	4300 4400 4300 4350
Wire Wire Line
	4350 4500 4300 4500
Wire Wire Line
	4300 4500 4300 4400
Connection ~ 4300 4400
Wire Wire Line
	5750 4400 5500 4400
Wire Wire Line
	5400 4700 5500 4700
$Comp
L Device:R_Small R4
U 1 1 5B8318BB
P 5500 4550
F 0 "R4" H 5559 4596 50  0000 L CNN
F 1 "54R" H 5559 4505 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5500 4550 50  0001 C CNN
F 3 "~" H 5500 4550 50  0001 C CNN
	1    5500 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 4450 5500 4400
Connection ~ 5500 4400
Wire Wire Line
	5500 4400 5400 4400
Wire Wire Line
	5500 4650 5500 4700
Connection ~ 5500 4700
Wire Wire Line
	5500 4700 5750 4700
$Comp
L Device:R_Small R3
U 1 1 5B831CF3
P 5500 2800
F 0 "R3" H 5559 2846 50  0000 L CNN
F 1 "54R" H 5559 2755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5500 2800 50  0001 C CNN
F 3 "~" H 5500 2800 50  0001 C CNN
	1    5500 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 2700 5500 2650
Connection ~ 5500 2650
Wire Wire Line
	5500 2650 5400 2650
Wire Wire Line
	5500 2900 5500 2950
Connection ~ 5500 2950
Wire Wire Line
	5500 2950 5400 2950
$Comp
L Device:R_Small R1
U 1 1 5B8322A1
P 3950 3200
F 0 "R1" H 4009 3246 50  0000 L CNN
F 1 "54R" H 4009 3155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3950 3200 50  0001 C CNN
F 3 "~" H 3950 3200 50  0001 C CNN
	1    3950 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0128
U 1 1 5B8325F3
P 3950 3350
F 0 "#PWR0128" H 3950 3100 50  0001 C CNN
F 1 "GND" H 3955 3177 50  0000 C CNN
F 2 "" H 3950 3350 50  0001 C CNN
F 3 "" H 3950 3350 50  0001 C CNN
	1    3950 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 3300 3950 3350
Wire Wire Line
	3950 3100 3950 3000
Connection ~ 3950 3000
Wire Wire Line
	3950 3000 3900 3000
$Comp
L Device:R_Small R2
U 1 1 5B832D1E
P 4000 4800
F 0 "R2" H 4059 4846 50  0000 L CNN
F 1 "54R" H 4059 4755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4000 4800 50  0001 C CNN
F 3 "~" H 4000 4800 50  0001 C CNN
	1    4000 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 4650 4000 4650
Wire Wire Line
	4000 4650 4000 4700
$Comp
L power:GND #PWR0129
U 1 1 5B8331EC
P 4000 4950
F 0 "#PWR0129" H 4000 4700 50  0001 C CNN
F 1 "GND" H 4005 4777 50  0000 C CNN
F 2 "" H 4000 4950 50  0001 C CNN
F 3 "" H 4000 4950 50  0001 C CNN
	1    4000 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 4900 4000 4950
Text GLabel 4000 4650 0    50   Input ~ 0
ECHO
$Comp
L Mechanical:MountingHole MH4
U 1 1 5B834297
P 5750 7050
F 0 "MH4" H 5850 7096 50  0000 L CNN
F 1 "MountingHole" H 5850 7005 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965" H 5750 7050 50  0001 C CNN
F 3 "~" H 5750 7050 50  0001 C CNN
	1    5750 7050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH3
U 1 1 5B83437F
P 5750 6850
F 0 "MH3" H 5850 6896 50  0000 L CNN
F 1 "MountingHole" H 5850 6805 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965" H 5750 6850 50  0001 C CNN
F 3 "~" H 5750 6850 50  0001 C CNN
	1    5750 6850
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH2
U 1 1 5B8343BD
P 5750 6600
F 0 "MH2" H 5850 6646 50  0000 L CNN
F 1 "MountingHole" H 5850 6555 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965" H 5750 6600 50  0001 C CNN
F 3 "~" H 5750 6600 50  0001 C CNN
	1    5750 6600
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH1
U 1 1 5B8343FB
P 5750 6350
F 0 "MH1" H 5850 6396 50  0000 L CNN
F 1 "MountingHole" H 5850 6305 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965" H 5750 6350 50  0001 C CNN
F 3 "~" H 5750 6350 50  0001 C CNN
	1    5750 6350
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C8
U 1 1 5B834596
P 8800 2650
F 0 "C8" H 8918 2696 50  0000 L CNN
F 1 "15u" H 8918 2605 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-6032-20_AVX-F_Pad2.25x2.35mm_HandSolder" H 8838 2500 50  0001 C CNN
F 3 "~" H 8800 2650 50  0001 C CNN
	1    8800 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0130
U 1 1 5B834676
P 8800 2500
F 0 "#PWR0130" H 8800 2350 50  0001 C CNN
F 1 "+12V" H 8815 2673 50  0000 C CNN
F 2 "" H 8800 2500 50  0001 C CNN
F 3 "" H 8800 2500 50  0001 C CNN
	1    8800 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0131
U 1 1 5B834BAA
P 8800 2800
F 0 "#PWR0131" H 8800 2550 50  0001 C CNN
F 1 "GND" H 8805 2627 50  0000 C CNN
F 2 "" H 8800 2800 50  0001 C CNN
F 3 "" H 8800 2800 50  0001 C CNN
	1    8800 2800
	-1   0    0    -1  
$EndComp
$Comp
L Device:Jumper JP1
U 1 1 5B838F55
P 4800 1500
F 0 "JP1" H 4800 1764 50  0000 C CNN
F 1 "Jumper" H 4800 1673 50  0000 C CNN
F 2 "Libs:JUMPER_5MM" H 4800 1500 50  0001 C CNN
F 3 "~" H 4800 1500 50  0001 C CNN
	1    4800 1500
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0132
U 1 1 5B8392A5
P 4500 1500
F 0 "#PWR0132" H 4500 1350 50  0001 C CNN
F 1 "VCC" H 4517 1673 50  0000 C CNN
F 2 "" H 4500 1500 50  0001 C CNN
F 3 "" H 4500 1500 50  0001 C CNN
	1    4500 1500
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0133
U 1 1 5B8392DE
P 5100 1500
F 0 "#PWR0133" H 5100 1350 50  0001 C CNN
F 1 "VCC" H 5117 1673 50  0000 C CNN
F 2 "" H 5100 1500 50  0001 C CNN
F 3 "" H 5100 1500 50  0001 C CNN
	1    5100 1500
	1    0    0    -1  
$EndComp
$Comp
L Connector:8P8C J1
U 1 1 5B839475
P 8150 3050
F 0 "J1" H 7820 3054 50  0000 R CNN
F 1 "8P8C" H 7820 3145 50  0000 R CNN
F 2 "Connector_RJ:RJ45_Amphenol_54602-x08_Horizontal" V 8150 3075 50  0001 C CNN
F 3 "~" V 8150 3075 50  0001 C CNN
	1    8150 3050
	-1   0    0    1   
$EndComp
$EndSCHEMATC
