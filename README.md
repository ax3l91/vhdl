# vhdlTop module: System
TestBench: TB

Επεξήγηση του συστήματος που επισυνάπτεται:

Inputs:
RST, bus: Ελέγχει τα rst των counter & memories
Clk, bit: clock input
din1 & din2, 8-bit bus: Είσοδος των data

Outputs:
dout, 9-bus: Έξοδος συστήματος, 1 bit extra το carry μπροστά.
dout1 & dout2 & ctro: for debugging purposes -> ignore.

Modules:
Controller: Προς το παρόν στέλνει μόνο σήματα rst και wei(write_enable) στις memories και στον counter.
	Future Features:
		Enables των υπόλοιπων modules
		Counter range for my counter
		Reset counter when count > addr_w

Counter: Simple counter me output = addr
	Problem:
		Initial value only with rst = '1', how to fix?

Memory:8-bit data_w, 12-bit addr_w. Λαμβάνουν data από din1 & din2. Reset not yet implemented (should clear the ram).

Bit8Adder: Same old 8-bit adder. Λαμβάνει τιμές (A,B) από εξόδους M0(dout1) και Μ1(dout2).

Memory9: 9-bit data_w, everything else same as Module: Memory, 1 extra bit for the carry that is being passed on by module: Bit8Adder

Το βασικότερο πρόβλημα του συστήματος είναι πως για κάποιο λόγο έχω delay ενός clock στo write της mem9. Δεν ξέρω αν φταίει το γεγονός ότι η process είναι sequential(???)

Εγώ όπως το έχω στο μυαλο μου το σύστημα θα ήθελα να έχει μόνο 3 εισόδους (din1,din2 και ένα ctrl). Το ctrl θέλω να είναι ένα n-bit bus το οποίο να παίρνει έννοια κωδικού και να σηκώνει τα ανάλογα flags
(π.χ όπως το έχω τώρα που αν σηκώσω "111" στο wei και "1000" στο rst θα θέσω τις μνήμες μου σε write_enable και θα κάνω reset τον counter)

Η πηγαίνοντας το ένα ακόμα βήμα παραπέρα θα μπορούσα να έχω 2 εισοδους (din και ctrl) και να περνάω κωδικό και data και ανάλογα τον κωδικό να πηγαίνει το data εκεί που θέλω(π.χ κωδικος για να γράφω στην mem0
η στην mem1 η ακόμα και να θέτω addr κανοντας bypass τον counter δίνοντας μου ακόμα περισσότερο έλεγχο στο σύστημα).
