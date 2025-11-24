/*
  # Weekly Challenges System

  1. New Tables
    - `weekly_challenges`
      - `id` (integer, primary key) - Challenge number (1-20)
      - `title` (text) - Challenge week title
      - `habit1_title` (text) - First habit title
      - `habit1_benefit1` (text) - First habit benefit 1
      - `habit1_benefit2` (text) - First habit benefit 2
      - `habit1_benefit3` (text) - First habit benefit 3
      - `habit2_title` (text) - Second habit title
      - `habit2_benefit1` (text) - Second habit benefit 1
      - `habit2_benefit2` (text) - Second habit benefit 2
      - `habit2_benefit3` (text) - Second habit benefit 3
      - `habit3_title` (text) - Third habit title
      - `habit3_benefit1` (text) - Third habit benefit 1
      - `habit3_benefit2` (text) - Third habit benefit 2
      - `habit3_benefit3` (text) - Third habit benefit 3
      - `created_at` (timestamp)
    
    - `challenge_settings`
      - `id` (integer, primary key)
      - `start_date` (date) - First Sunday of the challenge rotation
      - `created_at` (timestamp)
      - `updated_at` (timestamp)

  2. Security
    - Enable RLS on both tables
    - Add policies for public read access (challenges are public content)
    - Restrict write access to service role only

  3. Data
    - Insert all 20 challenges with their habits and benefits
    - Set initial start date to calculate weekly rotation
*/

-- Create weekly_challenges table
CREATE TABLE IF NOT EXISTS weekly_challenges (
  id integer PRIMARY KEY,
  title text NOT NULL,
  habit1_title text NOT NULL,
  habit1_benefit1 text NOT NULL,
  habit1_benefit2 text NOT NULL,
  habit1_benefit3 text NOT NULL,
  habit2_title text NOT NULL,
  habit2_benefit1 text NOT NULL,
  habit2_benefit2 text NOT NULL,
  habit2_benefit3 text NOT NULL,
  habit3_title text NOT NULL,
  habit3_benefit1 text NOT NULL,
  habit3_benefit2 text NOT NULL,
  habit3_benefit3 text NOT NULL,
  created_at timestamptz DEFAULT now()
);

-- Create challenge_settings table
CREATE TABLE IF NOT EXISTS challenge_settings (
  id integer PRIMARY KEY DEFAULT 1,
  start_date date NOT NULL,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE weekly_challenges ENABLE ROW LEVEL SECURITY;
ALTER TABLE challenge_settings ENABLE ROW LEVEL SECURITY;

-- Public read access for challenges
CREATE POLICY "Public can read challenges"
  ON weekly_challenges
  FOR SELECT
  TO anon, authenticated
  USING (true);

-- Public read access for settings
CREATE POLICY "Public can read challenge settings"
  ON challenge_settings
  FOR SELECT
  TO anon, authenticated
  USING (true);

-- Insert all 20 challenges
INSERT INTO weekly_challenges (id, title, habit1_title, habit1_benefit1, habit1_benefit2, habit1_benefit3, habit2_title, habit2_benefit1, habit2_benefit2, habit2_benefit3, habit3_title, habit3_benefit1, habit3_benefit2, habit3_benefit3) VALUES
(1, 'Hydration & Cognitive Clarity Week', 'Drink ~2 Litres of Water Daily', 'Prevents cognitive fatigue and improves focus.', 'Supports optimal blood volume for nutrient delivery.', 'Helps regulate body temperature and reduces fatigue.', 'Add One Electrolyte Drink Daily', 'Supports muscle contraction and nerve signalling.', 'Helps maintain hydration during training.', 'Reduces cramping risk.', 'Eat One Water-Rich Fruit/Vegetable Daily', 'Adds micronutrients + antioxidants.', 'Improves hydration via food.', 'Supports immune and recovery functions.'),
(2, 'High-Protein Habit Week', 'Eat 1.6g Protein per kg Bodyweight', 'Maximizes muscle repair and MPS.', 'Helps maintain lean mass.', 'Improves satiety.', 'Include Protein in Every Meal', 'Stabilises blood sugar.', 'Supports appetite control.', 'Provides steady amino acid availability.', 'Pre-Bed Protein (Yogurt, Shake, Cottage Cheese)', 'Enhances overnight recovery.', 'Reduces muscle breakdown during sleep.', 'Supports morning energy levels.'),
(3, 'Sleep Optimization Week', 'Aim for 7.5–8.5 Hours of Sleep', 'Improves recovery hormones.', 'Reduces inflammation.', 'Enhances cognitive function.', 'No Screens 45 Minutes Before Bed', 'Improves melatonin production.', 'Shortens sleep latency.', 'Enhances sleep quality.', 'Keep Bedroom Cool & Dark', 'Supports natural circadian rhythm.', 'Reduces night-time waking.', 'Improves REM sleep.'),
(4, 'Mobility & Flexibility Week', 'Do 10 Minutes of Stretching Daily', 'Reduces muscle stiffness.', 'Enhances joint mobility.', 'Improves posture.', 'Perform 5 Minutes of Hip & Spine Mobility', 'Supports long-term back health.', 'Improves squat depth and athletic movement.', 'Reduces injury risk.', 'Use a Foam Roller 3× This Week', 'Increases blood flow.', 'Helps break down tension.', 'Improves tissue recovery.'),
(5, 'Gut Health Week', 'Eat One Probiotic Food Daily', 'Improves digestion.', 'Supports immunity.', 'Enhances nutrient absorption.', 'Add One Fibre-Rich Food Daily', 'Improves gut motility.', 'Stabilises blood sugar.', 'Supports healthy microbiome diversity.', 'Reduce Processed Sugar (One Swap/Day)', 'Lowers inflammation.', 'Reduces bloating.', 'Supports stable energy levels.'),
(6, 'Strength Foundation Week', 'Do 3 Strength Sessions', 'Increases lean mass.', 'Boosts metabolism.', 'Improves bone density.', 'Focus on Progressive Overload', 'Drives long-term strength gains.', 'Improves muscle recruitment.', 'Enhances resilience.', 'Prioritise Compound Lifts', 'Maximizes efficiency.', 'Improves functional strength.', 'Burns more calories.'),
(7, 'Anti-Inflammatory Nutrition Week', 'Add One Omega-3 Source Daily', 'Reduces systemic inflammation.', 'Supports brain health.', 'Enhances recovery.', 'Eat a Colourful Plate (5 Colours/Day)', 'Increases antioxidant intake.', 'Improves cell repair.', 'Supports immune resilience.', 'Replace One Meal With a Whole-Food Option', 'Reduces processed ingredient load.', 'Supports stable energy.', 'Enhances nutrient density.'),
(8, 'Step Count Boost Week', 'Hit 8,000–10,000 Steps Daily', 'Improves cardiovascular health.', 'Supports fat loss.', 'Reduces stress.', 'Take a 10-Min Walk After Meals', 'Stabilises blood glucose.', 'Improves digestion.', 'Reduces fatigue.', 'Stand/Move Every Hour', 'Reduces stiffness.', 'Improves circulation.', 'Supports long-term joint health.'),
(9, 'Mental Reset Week', '5 Minutes of Deep Breathing Daily', 'Lowers cortisol.', 'Improves HRV.', 'Enhances focus.', '10 Minutes Device-Free Time', 'Reduces dopamine fatigue.', 'Supports mental clarity.', 'Improves mood.', 'Write 3 Daily Wins', 'Builds positive habit loops.', 'Improves mental resilience.', 'Reduces overwhelm.'),
(10, 'Clean Eating Reset Week', 'Eat 2 Whole-Food Meals Per Day', 'Improves digestion.', 'Stabilises energy.', 'Supports micronutrient intake.', 'Drink Water Before Every Meal', 'Enhances satiety.', 'Reduces overeating.', 'Supports digestion.', 'Include One "Green" Food Daily', 'Adds essential vitamins.', 'Supports liver detox pathways.', 'Reduces inflammation.'),
(11, 'Cardio Health Week', '20 Minutes Moderate Cardio × 3', 'Supports heart function.', 'Improves endurance.', 'Reduces stress.', 'One High-Intensity Burst', 'Boosts VO2 max.', 'Enhances metabolism.', 'Improves athletic capacity.', 'Low-Intensity Movement Daily', 'Promotes recovery.', 'Supports fat oxidation.', 'Improves circulation.'),
(12, 'Posture & Core Stability Week', '5 Minutes of Core Work Daily', 'Supports spine health.', 'Enhances athletic movement.', 'Reduces injury risk.', 'Postural Check Every Hour', 'Reduces neck/back pain.', 'Improves breathing efficiency.', 'Supports better lifting technique.', 'One Back Strength Exercise Daily', 'Balances chest-heavy training.', 'Improves alignment.', 'Enhances shoulder health.'),
(13, 'Recovery Reset Week', 'Prioritise Sleep (Bed 30 Min Earlier)', 'Enhances hormone balance.', 'Reduces fatigue.', 'Supports muscle growth.', 'Take One Rest Day Properly', 'Reduces risk of overtraining.', 'Enhances progress.', 'Improves mood.', 'Gentle Mobility on Rest Days', 'Supports blood flow.', 'Reduces stiffness.', 'Enhances recovery rate.'),
(14, 'Anti-Stress Lifestyle Week', '10 Minutes Light Walking Alone', 'Clears mental load.', 'Enhances creativity.', 'Lowers stress hormones.', 'Reduce Caffeine After 2pm', 'Improves sleep.', 'Reduces anxiety.', 'Balances cortisol.', 'Replace One Scroll Session With Reading', 'Reduces dopamine fatigue.', 'Improves attention span.', 'Boosts mental clarity.'),
(15, 'Immune Support Week', 'Eat One Vitamin C Source Daily', 'Supports immune cell function.', 'Reduces inflammation.', 'Enhances recovery.', 'Add a Zinc Source 3× Weekly', 'Strengthens immunity.', 'Supports hormone balance.', 'Supports wound healing.', 'Stay Hydrated (2L+)', 'Supports lymphatic flow.', 'Reduces fatigue during illness.', 'Enhances cellular function.'),
(16, 'Strength & Power Week', '3 Heavy Resistance Sessions', 'Builds strength.', 'Stimulates bone density.', 'Boosts confidence.', 'Add Explosive Movements', 'Improves power output.', 'Enhances athleticism.', 'Increases fast-twitch activation.', 'Prioritise Protein Timing', 'Enhances strength adaptation.', 'Reduces soreness.', 'Improves recovery window.'),
(17, 'Blood Sugar Control Week', 'Walk 10 Minutes After Eating', 'Reduces glucose spikes.', 'Supports digestion.', 'Improves insulin sensitivity.', 'Pair Carbs With Protein/Fats', 'Slows glucose absorption.', 'Reduces cravings.', 'Provides stable energy.', 'Drink Water Before Coffee', 'Supports hydration.', 'Reduces cortisol spike.', 'Improves alertness.'),
(18, 'Anti-Bloat & Digestion Week', 'Add Digestive Enzymes or Ginger Tea', 'Enhances digestion.', 'Reduces bloating.', 'Supports gut comfort.', 'Slow Down Eating', 'Reduces gas and bloat.', 'Enhances nutrient absorption.', 'Supports hunger regulation.', 'Avoid Carbonated Drinks for 1 Week', 'Reduces gastric pressure.', 'Improves digestive comfort.', 'Supports gut balance.'),
(19, 'Mini-Cut Metabolism Week', 'High-Protein Breakfast', 'Supports satiety.', 'Reduces cravings later.', 'Stabilises glucose.', 'Replace One Meal With a Clean Option', 'Lowers calorie load.', 'Improves micronutrients.', 'Reduces inflammation.', 'Hit 9,000 Steps Daily', 'Improves fat oxidation.', 'Burns extra calories.', 'Reduces stress.'),
(20, 'Heart & Longevity Week', '20 Minutes Zone 2 Cardio 3×', 'Enhances mitochondrial health.', 'Improves endurance.', 'Supports lifespan.', 'Add One Extra Portion of Greens Daily', 'Supports nitric oxide production.', 'Reduces vascular inflammation.', 'Improves circulation.', 'Reduce Alcohol for the Week', 'Improves sleep.', 'Supports liver health.', 'Enhances recovery.')
ON CONFLICT (id) DO NOTHING;

-- Set initial start date to the most recent Sunday at midnight GMT
-- This will be used to calculate which week we're on
INSERT INTO challenge_settings (id, start_date) 
VALUES (1, '2025-01-05'::date)
ON CONFLICT (id) DO UPDATE SET start_date = EXCLUDED.start_date;