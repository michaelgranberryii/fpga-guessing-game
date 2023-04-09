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
    CONSTANT CP : TIME := 20 ns;
    CONSTANT stable_wait_time : integer := 10;
BEGIN
    uut : ENTITY work.debounce
        GENERIC MAP(
            clk_freq => 1024,
            stable_time => 5)
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
         WAIT FOR CP;
         rst_tb <= '0';
         WAIT FOR CP;

        -- bouncing input
        button_tb <= '0';
        WAIT FOR CP;
        button_tb <= '1';
        WAIT FOR CP;
        button_tb <= '0';
        WAIT FOR CP;
        button_tb <= '1';
        WAIT FOR CP;
        button_tb <= '0';
        WAIT FOR CP;
        button_tb <= '1';
        WAIT FOR CP;
        button_tb <= '0';
        WAIT FOR CP;

        -- stable input
        button_tb <= '1';
        WAIT FOR stable_wait_time*CP;
        button_tb <= '0';
        WAIT FOR stable_wait_time*CP;

         -- bouncing input
        button_tb <= '0';
        WAIT FOR CP;
        button_tb <= '1';
        WAIT FOR CP;
        button_tb <= '0';
        WAIT FOR CP;
        button_tb <= '1';
        WAIT FOR CP;
        button_tb <= '0';
        WAIT FOR CP;
        button_tb <= '1';
        WAIT FOR CP;
        button_tb <= '0';
        WAIT FOR CP;

        -- stable input
        button_tb <= '1';
        WAIT FOR stable_wait_time*CP;
        button_tb <= '0';
        WAIT FOR stable_wait_time*CP;

        stop;
    END PROCESS;

END Behavioral;