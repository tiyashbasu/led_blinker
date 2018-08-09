library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--TESTBENCH--
entity TESTBENCH is
    port (LED_SERIES : out std_logic_vector(7 downto 0));
end TESTBENCH;

architecture Behavioral of TESTBENCH is

	component LEDS is
        port (
            CLK_IN : in std_logic;
            LED_SERIES : out std_logic_vector(7 downto 0)
        );
    end component;

    signal CLK: std_logic := '0';

begin
    leds1: LEDS port map (CLK, LED_SERIES);
    CLK <= NOT CLK AFTER 10ns; -- 100Mhz
end Behavioral;
