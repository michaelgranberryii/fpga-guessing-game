LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE std.env.stop;
ENTITY debounce_tb IS
END debounce_tb;

ARCHITECTURE Behavioral OF debounce_tb IS
    SIGNAL clk_tb : STD_LOGIC := '0';
    SIGNAL rst_tb : STD_LOGIC;
    SIGNAL button_tb : STD_LOGIC;
    SIGNAL result_tb : STD_LOGIC;
    CONSTANT CP : TIME := 8 ns;
    CONSTANT bounce : TIME := 1 ns;
BEGIN
    uut : ENTITY work.debounce
        GENERIC MAP(
            clk_freq => 125_000_000,
            stable_time => 10)
        PORT MAP(
            clk => clk_tb,
            rst => rst_tb,
            button => button_tb,
            result => result_tb
        );

    clock : PROCESS
    BEGIN
        clk_tb <= NOT clk_tb;
        WAIT FOR CP/2;
    END PROCESS;

    test : PROCESS
    BEGIN
         button_tb <= '0';
         rst_tb <= '1';
         WAIT FOR 5 ms;
         rst_tb <= '0';
         WAIT FOR 5 ms;

        -- bouncing input
        button_tb <= '0';
        WAIT FOR 1 ms;
        button_tb <= '1';
        WAIT FOR 1 ms;
        button_tb <= '0';
        WAIT FOR 1 ms;
        button_tb <= '1';
        WAIT FOR 1 ms;
        button_tb <= '0';
        WAIT FOR 1 ms;
        button_tb <= '1';
        WAIT FOR 1 ms;
        button_tb <= '0';
        WAIT FOR 1 ms;

        -- stable input
        button_tb <= '1';
        WAIT FOR 20 ms;
        button_tb <= '0';
        WAIT FOR 20 ms;

         -- bouncing input
        button_tb <= '0';
        WAIT FOR 1 ms;
        button_tb <= '1';
        WAIT FOR 1 ms;
        button_tb <= '0';
        WAIT FOR 1 ms;
        button_tb <= '1';
        WAIT FOR 1 ms;
        button_tb <= '0';
        WAIT FOR 1 ms;
        button_tb <= '1';
        WAIT FOR 1 ms;
        button_tb <= '0';
        WAIT FOR 1 ms;

        -- stable input
        button_tb <= '1';
        WAIT FOR 20 ms;
        button_tb <= '0';
        WAIT FOR 20 ms;

        stop;
    END PROCESS;

END Behavioral;