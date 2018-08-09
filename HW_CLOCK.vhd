library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Library UNISIM;
use UNISIM.vcomponents.all;

entity HW_CLOCK is
    port (
        CLK_IN : in std_logic;
        CLK_OUT : out std_logic
    );
end HW_CLOCK;

architecture Behavioral of HW_CLOCK is

    signal IBUF_OUT : std_logic;

begin

    IBUFG_inst : IBUFG
    generic map (
        IBUF_LOW_PWR => TRUE,       -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
        IOSTANDARD => "DEFAULT")
    port map (
        O => IBUF_OUT,              -- Clock buffer output
        I => CLK_IN                 -- Clock buffer input (connect directly to top-level port)
    );

    BUFG_inst : BUFG
    port map (
        O => CLK_OUT,               -- 1-bit output: Clock buffer output
        I => IBUF_OUT               -- 1-bit input: Clock buffer input
    );

end Behavioral;
