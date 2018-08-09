library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SCALED_HW_CLOCK is
    port (
        CLK_IN : in std_logic;
        CLK_OUT : out std_logic
    );
end SCALED_HW_CLOCK;

architecture Behavioral of SCALED_HW_CLOCK is

    component HW_CLOCK is
        port (
            CLK_IN : in std_logic;
            CLK_OUT : out std_logic
        );
    end component;

    signal CLK_BUF : std_logic;

begin

    hw_clk_1 : HW_CLOCK port map (CLK_IN, CLK_BUF);

    process (CLK_BUF)
        constant full_period : integer := 5000000;
        constant half_period : integer := 2500000;
        variable counter : integer := 0;
    begin
        if (rising_edge(CLK_BUF)) then
            if (counter = half_period) then
                CLK_OUT <= '0';
                counter := counter + 1;
            elsif (counter = full_period) then
                CLK_OUT <= '1';
                counter := 0;
            else
                counter := counter + 1;
            end if;
        end if;
    end process;

end Behavioral;
