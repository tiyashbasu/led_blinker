library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LEDS is
    port (
        CLK_IN : in std_logic;
        LED_SERIES : out std_logic_vector(7 downto 0)
    );
end LEDS;

architecture Behavioral of LEDS is

    component SCALED_HW_CLOCK is
        port (
            CLK_IN : in std_logic;
            CLK_OUT : out std_logic
        );
    end component;

    signal CLK_BUF : std_logic;

    signal LEDS_BUF : unsigned(7 downto 0) := "10000000";

begin

    scaled_hw_clk_1 : SCALED_HW_CLOCK port map (CLK_IN, CLK_BUF);

    LED_SERIES <= std_logic_vector(LEDS_BUF);

    process (CLK_BUF)
    begin
        if (rising_edge(CLK_BUF)) then
            if (LEDS_BUF = "00000001") then
                LEDS_BUF <= "10000000";
            else
                LEDS_BUF <= shift_right(LEDS_BUF, 1);
            end if;
        end if;
    end process;

end Behavioral;
