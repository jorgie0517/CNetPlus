﻿TASK3: THE ULTIMATE SKILL FOR A NETWORK ENGINEER.
Top 5 brands: PANG MAYAMAN
1.Cisco = 75% =google,aws,azure,etc,
        Cisco Invented the FirstEthernetSW
        Cisco Patent Expires.
2.Dell/ExtremeNetwork/Arista/AlliedTelesys
3.HP procurve
4.Juniper/Fortinet
5.Huawei      =

sh spanning-tree vlan 1

TASK3: EXPENSIVE SWITCH/MANAGEABLE SWITCH:\ = 20k
1. mac address learning": sh mac address-table
2  mac address filtering
3  mac address forwaring
4  Php: loop avoidance
5. $$: Vlan Feature $$ = 60k up

COREbaba12#sh mac address-table

TASK4: Mastering the Switch BUttons:
Mode Button: jailBreak/Password Forget/ factory reset 
Poweroff, Press Mode, until
Switch:  flash_init
	 delete flash:config.text
         delete flash:vlan.dat
         boot

TASK5: HOW TO SPOT A VERY HEALTHY SWITCH?
super healthy: "all flashing green."
amber/orange: needs help. - you are protected
##how to LEGallY "defective" your Expensive Cisco @ office:
create vlans,
transfer ports to vlans
delete the vlan
Ports are forever DEAD
config t
vlan 69
exit
int range fa 0/1-5
 swi acc vlan 69

indicator no.2: if you plug a device=30s

indicator no.3: Kislap every 1/2 seconds

TASK6: HOW TO GET FIRED IMMEDIATELY!
SIRAIN NG TODO SI @taas at @baba:
config t
NO spanning-tree vlan 1-999
end
AYUSIN ULET IS @taas: AT @baba
config t
 spanning-tree vlan 1-999
end

TASK7: HOW TO BECOME A WORLD-CLASS NETWORK ENGINEER
SPECIALIZING IN SWITCH:
Master the 4 super Hereos of Switching
Qpid: 802.1Q:trunking
"make switch love each other!"LQ
Darna: 802.1d: STP
"slowly protect switches" , wait 30 seconds 
lis=15, lrn=15s, fwd: or blk.
WonderWoman: 802.1w: rapidSTP
"quickly,Brutally protect switches"
SuperMan: 802.1s: MiSTP
"Protect Many Switches at the same time!"

TASK8: ACCESS PORTS VS TRUNK PORTS: lab mo sa exam.
+
TAAS/BABA:
config t
Int Range fa0/10-12
 shutdown
 switchport trunk Encap Dot1Q
 switchport mode trunk
 switchport trunk allowed vlan 1-100
 no shut
 do sh int trunk
Dot1q = Qupid,mave switches love each other:
      IEEE standard where SW will from Layer 2 trunks

TASK9: SPANNING-TREE PROTOCOL: 802.1D: protect switches Slowly.
blk-lis-lrn-fwd = 30 seconds.
wireshark = bridge priority is 32768 = very Hackable!
" bobo/inutil ang Network Engineer nyo sa company!"
Protect the Most Important SWitch in your 
Office: RootBridge = TAAS, 2ndRootBridge = BABA:
TAAS:/d1       32786 --> 24576
Config t
spanning-tree mode pvst
spanning-tree vlan 1-100 root Primary
do sh spanning-tree vlan 1
BABA:/d2         32768->   28672
Config t              
spanning-tree mode pvst
spanning-tree vlan 1-100 root Secondary
do sh spanning-tree vlan 1

TASK9.1: STP port states. 802.1D states.
iniwanngSyuta: lungkot,galit,lasing,moveOn.
Switch: show spanning-tree vlan 1
Blk - LIS - LRN -FWD
      15s   15s     = 30s

Task9.2: STP Port Roles: 802.1D protect switches slowly/gently 30s
DesignatedPort/DP = fwd port of Root Bridge
RootPort/RP = fwd port of non-root Bridge(1 only)
AlternatePort/AP = blk port of nonRootPorts
BackupPort = yuck yuck, suck urself. enter urself, self-service

how becomes RootPort = kanangKamay
Cost >> Priority >> Number, lowest cost WINS!
10G cost - 1
1gig cost = 4
faE cost = 19

who is darna: 802.1d
kabit PC = 30s
putol trunk, recover =30s, acceptable? BANK,PolHOst,,Mil

TASK10: Rapid Spanning-tree Protocol: 802.1w
TAAs/BABA: tikam si wonderWoman/bilis labasan: taas,baba,d1,d2,a1,a2:
config t
spanning-tree Mode Rapid-pvst
do sh spanning-tree vlan 1
configure 802.1w/RapidSTP:

TAAS/d1: RootBridge: laspagin si Wonderwoman
config t
spanning-tree Mode Rapid-pvst
spanning-tree BackBoneFast
spanning-tree portfast bpduguard default
Int Range fa0/1-8
   spanning-tree Portfast
@BABA/d2/a1/a2:
config t
spanning-tree Mode Rapid-pvst
spanning-tree UplinkFast
spanning-tree portfast bpduguard default
Int Range fa0/1-8
  spanning-tree Portfast
end

802.1WDoes NOT forgive Mistakes/KIll it.
#sh int status err-disabled 
TAAS: bounce/UP/down, bring BACK TO LIFE.
config t
int fa 0/3
 shut
 no shut
int fa 0/7
 shut
 no shut
end

TASK11: Multiple instance STP: 802.1s
Make FORCEs all CPU/Instances work to protect VLANs, cpu0 = is working 
step1: sync all Vlans with VTP:vlanTrunkingProtocol:
TAAS/BABA: d1/d2:
config t
vtp domain ccna
vtp password pass
vtp mode server
vtp version 2
exit

a1/a2: access SW
config t
vtp domain ccna
vtp password pass
vtp mode client
vtp version 1
exit


step2: 
create vlans:
TAAS:/D1
config t
vlan 11-19
exit
vlan 21-29
exit
vlan 31-39
exit
BABA: sh vlan brief:
@ENABLE SUPERMAN: 802.1S
cpu1: vlan 11-19
cpu2: vlan 21-29
cpu3: vlan 31-39
@TAAs/BABA: d1,d2,a1,a2
CONFIG T
spanning-tree mode Mst
spanning-tree mst configuration
 name supermanstp
 revision 1
   Instance 1 vlan 11-19
   Instance 2 vlan 21-29
   Instance 3 vlan 31-39
exit
do sh spanning-tree mst configuration 

TASK14: MAKE YOUR OWN SUPERMAN BOSSING:


@Taas: Make Taas RootBridge again:/d1
config t
spanning-tree mst 0 root primary
spanning-tree mst 1 root secondary
spanning-tree mst 2 root primary
spanning-tree mst 3 root secondary
@baba/d2
config t
spanning-tree mst 0 root Secondary
spanning-tree mst 1 root primary
spanning-tree mst 2 root Secondary
spanning-tree mst 3 root primary

TASK15: Implementing Port-Security in Cisco/bawal Nakaw/bawalPalit.
Switch:
baba:
sh cdp nei
Port-Security: Secure/Guard the MacAddress/Layer2
device so that you canNOT replace it with hacking
device.
How to protect your SwitchFrom" man in the middle
attack using Arduino!"
Guard fa0/5 and fa0/7 so that, no Arduino can
be connected.
@BABA
config t
Int fa0/6
switchport mode access
switchport port-security
switchport port-security mac-address Sticky
switchport port-security maximum 1
switchport port-security violation shutdown
Int fa0/8
switchport mode access
switchport port-security
switchport port-security mac-address Sticky
switchport port-security maximum 1
switchport port-security violation shutdown
do sh port-security address
   1    ccd8.c1fb.1045    SecureSticky                  Fa0/6        -
   1    ccd8.c1fb.2325    SecureSticky                  Fa0/8
do sh int status err-disable

Port      Name               Status       Reason               Err-disabled Vlans
Fa0/6                        err-disabled psecure-violation
Fa0/8                        err-disabled psecure-violation
@baba: make it alive:
config t
Int fa0/6
NO switchport port-security
shut
no shut
Int fa0/8
NO switchport port-security
shut
no shut

TASK16: FHRP:First Hop Redundancy Protocol:
        " The Rich Kid Problem!" = richKidSolution.
HSRP: hot standby routing protocol: all Cisco SW:
    2 or more switches combine to form One virtualIP
VRRP: virtual router redundancy protocol: any brand
GLBP: global load balancing protocol: all Cisco Router
Companies: 2 or 3 telcos:
@TAAS/PLDTinternet:
config t
hostname PLDT-ITO
Track 1 Int gi 0/1 line-protocol
Int vlan 1
standby 1 ip 10.__.1.6
standby 1 preempt
standby 1 Priority 150
standby 1 Track 1 decrement 60

@D1 para realworld:
config t
Track 1 Int e1/0 line-protocol
Int vlan 10
standby 10 ip 10.2.1.3
standby 10 preempt
standby 10 Priority 150
standby 10 Track 1 decrement 60

COREBABA/GLOBE:
config t
hostname GLOBE-ITO
Int vlan 1
standby 1 ip 10.__.1.6
standby 1 preempt
standby 1 Priority 100
end

@D2 para real world
config t
Int vlan 10
standby 10 ip 10.2.1.3
standby 10 preempt
standby 10 Priority 100
do sh standby

#KUNG KAYA MO 80 TO 150K A MONTH: vrrp and glbp:
@@ D1
config t
Track 1 Int e1/0 line-protocol
Int vlan 10
no standby 10
VRRP 10 ip 10.2.1.3
VRRP 10 preempt
VRRP 10 Priority 150
VRRP 10 Track 1 decrement 60

@@ D2
config t
Int vlan 10
no standby 10
VRRP 10 ip 10.2.1.3
VRRP 10 preempt
VRRP 10 Priority 100


TASK17: Port-Aggregation/Etherchannel: 100% exam LAB!!!
LACP:LINK AGGREGATION CONTROL PROTOCOL = ieee worldStandrad
cisco = PortAggregationProtocol: PaGP
Combinding Two/More Layer 2 links AS ONE! Unite/UNITY
@taas/BABA:
config t
Int Range fa0/10-12
 channel-group 1 mode active
 channel-protocol Lacp
 do sh etherchannel summary
 do sh int po1 | inc BW