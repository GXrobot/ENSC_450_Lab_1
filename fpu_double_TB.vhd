---------------------------------------------------------------------
----                                                             ----
----  FPU                                                        ----
----  Floating Point Unit (Double precision)                     ----
----                                                             ----
----  Author: David Lundgren                                     ----
----          davidklun@gmail.com                                ----
----                                                             ----
---------------------------------------------------------------------
----                                                             ----
---- Copyright (C) 2009 David Lundgren                           ----
----                  davidklun@gmail.com                        ----
----                                                             ----
---- This source file may be used and distributed without        ----
---- restriction provided that this copyright statement is not   ----
---- removed from the file and that any derivative work contains ----
---- the original copyright notice and the associated disclaimer.----
----                                                             ----
----     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ----
---- EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ----
---- TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ----
---- FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ----
---- OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ----
---- INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ----
---- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ----
---- GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ----
---- BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ----
---- LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ----
---- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ----
---- OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ----
---- POSSIBILITY OF SUCH DAMAGE.                                 ----
----                                                             ----
---------------------------------------------------------------------

library ieee;
-- use work.fpupack.all;
-- use work.comppack.all;
use ieee.std_logic_misc.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;


entity fpu_double_tb is
end fpu_double_tb;

architecture TB_ARCHITECTURE of fpu_double_tb is

	component fpu_double
	port(
		clk : in std_logic;
		rst : in std_logic;
		enable : in std_logic;
		rmode : in std_logic_vector(1 downto 0);
		fpu_op : in std_logic_vector(2 downto 0);
		opa : in std_logic_vector(63 downto 0);
		opb : in std_logic_vector(63 downto 0);
		out_fp : out std_logic_vector(63 downto 0);
		ready : out std_logic;
		underflow : out std_logic;
		overflow : out std_logic;
		inexact : out std_logic;
		exception : out std_logic;
		invalid : out std_logic );
	end component;

	signal clk : std_logic;
	signal rst : std_logic;
	signal enable : std_logic;
	signal rmode : std_logic_vector(1 downto 0);
	signal fpu_op : std_logic_vector(2 downto 0);
	signal opa : std_logic_vector(63 downto 0);
	signal opb : std_logic_vector(63 downto 0);
	signal out_fp : std_logic_vector(63 downto 0);	   
	
	signal ready : std_logic;
	signal underflow : std_logic;
	signal overflow : std_logic;
	signal inexact : std_logic;
	signal exception : std_logic;
	signal invalid : std_logic;

	signal END_SIM: BOOLEAN:=FALSE;
	signal out_fp1 : std_logic_vector(63 downto 0);


begin
	out_fp1 <= out_fp;
	UUT : fpu_double
		port map (
			clk => clk,
			rst => rst,
			enable => enable,
			rmode => rmode,
			fpu_op => fpu_op,
			opa => opa,
			opb => opb,
			out_fp => out_fp,
			ready => ready,
			underflow => underflow,
			overflow => overflow,
			inexact => inexact,
			exception => exception,
			invalid => invalid
		);

	
STIMULUS: process
begin  



	rst <= '1';
    wait for 20 ns; 
	rst <= '0';
--inputA:4.0000000000e+000
--inputB:-4.0000000000e+000
enable <= '1';
opa <= "0100000000010000000000000000000000000000000000000000000000000000";
opb <= "1100000000010000000000000000000000000000000000000000000000000000";
fpu_op <= "000";
rmode <= "10";
wait for 20ns;
enable <= '0';
wait for 800 ns;
--Output:0.000000000000000e+000
-- out_fp = 0000000000000000
--inputA:-8.8899000000e+002
--inputB:7.8898020000e+002
enable <= '1';
opa <= "1100000010001011110001111110101110000101000111101011100001010010";
opb <= "0100000010001000101001111101011101110011000110001111110001010000";
fpu_op <= "000";
rmode <= "11";
wait for 20ns;
enable <= '0';
wait for 800 ns;
--Output:-1.000098000000000e+002
-- out_fp = C05900A0902DE010
--inputA:1.9500000000e-308
--inputB:1.8800000000e-308
enable <= '1';
opa <= "0000000000001110000001011010001000110110111111110101001011001101";
opb <= "0000000000001101100001001100011001100110111010010000011110011111";
fpu_op <= "000";
rmode <= "10";
wait for 20ns;
enable <= '0';
wait for 800 ns;
--Output:3.830000000000000e-308
-- out_fp = 001B8A689DE85A6C
--inputA:-9.9000000000e-002
--inputB:4.0220000000e+001
enable <= '1';
opa <= "1011111110111001010110000001000001100010010011011101001011110010";
opb <= "0100000001000100000111000010100011110101110000101000111101011100";
fpu_op <= "000";
rmode <= "11";
wait for 20ns;
enable <= '0';
wait for 800 ns;
--Output:4.012100000000000e+001
-- out_fp = 40440F7CED916872
--inputA:9.0770000000e+001
--inputB:-2.0330000000e+001
enable <= '1';
opa <= "0100000001010110101100010100011110101110000101000111101011100001";
opb <= "1100000000110100010101000111101011100001010001111010111000010100";
fpu_op <= "000";
rmode <= "00";
wait for 20ns;
enable <= '0';
wait for 800 ns;
--Output:7.044000000000000e+001
-- out_fp = 40519C28F5C28F5C
--inputA:9.0000000000e+034
--inputB:4.0000000000e+023
enable <= '1';
opa <= "0100011100110001010101010101011110110100000110011100010111000010";
opb <= "0100010011010101001011010000001011000111111000010100101011110110";
fpu_op <= "000";
rmode <= "10";
wait for 20ns;
enable <= '0';
wait for 800 ns;
--Output:9.000000000040000e+034
-- out_fp = 47315557B41A1A76
--inputA:4.0000000000e+080
--inputB:3.0000000000e-002
enable <= '1';
opa <= "0101000010101010111111001110111101010001111100001111101101011111";
opb <= "0011111110011110101110000101000111101011100001010001111010111000";
fpu_op <= "000";
rmode <= "10";
wait for 20ns;
enable <= '0';
wait for 800 ns;
--Output:4.000000000000001e+080
-- out_fp = 50AAFCEF51F0FB60
--inputA:9.0000000000e-311
--inputB:8.0000000000e-311
enable <= '1';
opa <= "0000000000000000000100001001000101001010010011000000001001011010";
opb <= "0000000000000000000011101011101000001001001001110001111010001001";
fpu_op <= "000";
rmode <= "00";
wait for 20ns;
enable <= '0';
wait for 800 ns;
--Output:1.700000000000010e-310
-- out_fp = 00001F4B537320E3
--inputA:6.1000000000e+000
--inputB:-6.0990000000e+000
enable <= '1';
opa <= "0100000000011000011001100110011001100110011001100110011001100110";
opb <= "1100000000011000011001010110000001000001100010010011011101001100";
fpu_op <= "000";
rmode <= "10";
wait for 20ns;
enable <= '0';
wait for 800 ns;
--Output:9.999999999994458e-004
-- out_fp = 3F50624DD2F1A000
--inputA:-9.0000000000e+088
--inputB:4.0000000000e+084
enable <= '1';
opa <= "1101001001100110100111110000000010010101111101001101000000000000";
opb <= "0101000110000000011110001110000100010001110000110101010101101101";
fpu_op <= "000";
rmode <= "00";
wait for 20ns;
enable <= '0';
wait for 800 ns;
--Output:-8.999600000000000e+088
-- out_fp = D2669EBEB27088F3
--inputA:-5.0000000000e-309
--inputB:4.0000000000e-310
enable <= '1';
opa <= "1000000000000011100110000110101100111100000011001111010001101001";
opb <= "0000000000000000010010011010001000101101110000111001100010101100";
fpu_op <= "000";
rmode <= "11";
wait for 20ns;
enable <= '0';
wait for 800 ns;
--Output:-4.600000000000001e-309
-- out_fp = 80034EC90E495BBD
--inputA:4.5570000000e+002
--inputB:3.4229100000e+003
enable <= '1';
opa <= "0100000001111100011110110011001100110011001100110011001100110011";
opb <= "0100000010101010101111011101000111101011100001010001111010111000";
fpu_op <= "000";
rmode <= "01";
wait for 20ns;
enable <= '0';
wait for 800 ns;
--Output:3.878610000000000e+003
-- out_fp = 40AE4D3851EB851E
--inputA:3.9800000000e+000
--inputB:3.7700000000e+000
enable <= '1';
opa <= "0100000000001111110101110000101000111101011100001010001111010111";
opb <= "0100000000001110001010001111010111000010100011110101110000101001";
fpu_op <= "000";
rmode <= "01";
wait for 20ns;
enable <= '0';
wait for 800 ns;
--Output:7.750000000000000e+000
-- out_fp = 401F000000000000


	END_SIM <= TRUE;

	wait;
end process; 
	
CLOCK_clk : process
begin
	
	if END_SIM = FALSE then
		clk <= '0';
		wait for 5 ns;
	else
		wait;
	end if;
	if END_SIM = FALSE then
		clk <= '1';
		wait for 5 ns; 
	else
		wait;
	end if;
end process;



end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_fpu_double of fpu_double_tb is
	for TB_ARCHITECTURE
		for UUT : fpu_double
			use entity work.fpu_double(rtl);
		end for;
	end for;
end TESTBENCH_FOR_fpu_double;

