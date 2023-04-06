LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE std.env.stop;

ENTITY single_pulse_detector_tb IS

END single_pulse_detector_tb;

ARCHITECTURE Behavioral OF single_pulse_detector_tb IS
    SIGNAL clk_tb : STD_LOGIC := '1';
    SIGNAL rst_tb : STD_LOGIC;
    SIGNAL input_signal_tb : STD_LOGIC;
    SIGNAL output_pulse_00_tb : STD_LOGIC;
    SIGNAL output_pulse_01_tb : STD_LOGIC;
    SIGNAL output_pulse_10_tb : STD_LOGIC;
    SIGNAL output_pulse_11_tb : STD_LOGIC;
    CONSTANT CP : TIME := 8 ns;
BEGIN

    -- Rising Edge
    uut_00 : ENTITY work.single_pulse_detector
        generic map (detect_type => "00")
        PORT MAP(
            clk => clk_tb,
            rst => rst_tb,
            input_signal => input_signal_tb,
            output_pulse => output_pulse_00_tb);
    
    -- Falling Edge
    uut_01 : ENTITY work.single_pulse_detector
        generic map (detect_type => "01")
        PORT MAP(
            clk => clk_tb,
            rst => rst_tb,
            input_signal => input_signal_tb,
            output_pulse => output_pulse_01_tb);
    
    -- Both Edges
    uut_10 : ENTITY work.single_pulse_detector
        generic map (detect_type => "10")
        PORT MAP(
            clk => clk_tb,
            rst => rst_tb,
            input_signal => input_signal_tb,
            output_pulse => output_pulse_10_tb);
            
    -- None
    uut_11 : ENTITY work.single_pulse_detector
        generic map (detect_type => "11")
        PORT MAP(
            clk => clk_tb,
            rst => rst_tb,
            input_signal => input_signal_tb,
            output_pulse => output_pulse_11_tb);

    PROCESS
    BEGIN
        clk_tb <= NOT clk_tb;
        WAIT FOR CP/2;
    END PROCESS;

    PROCESS
    BEGIN
        rst_tb <= '1';
        WAIT FOR CP;
        rst_tb <= '0';
        WAIT;
    END PROCESS;
    
    PROCESS
    BEGIN
        input_signal_tb <= '0';
        WAIT FOR 5 * CP;
        input_signal_tb <= '1';
        WAIT FOR 10 * CP;
        input_signal_tb <= '0';
        WAIT FOR 15 * CP;
        input_signal_tb <= '1';
        WAIT FOR 10 * CP;
        input_signal_tb <= '0';
        WAIT FOR 5 * CP;
        stop;
    END PROCESS;

END Behavioral;