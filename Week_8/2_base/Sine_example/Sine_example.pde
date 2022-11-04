import processing.sound.*;

SinOsc sine;
Env env;

// Times and levels for the ASR envelope
float attackTime = 0.001;
float sustainTime = 0.004;
float sustainLevel = 0.3;
float releaseTime = 0.2;

// duration before triggering new note
int duration = 1000;

// This variable stores the point in time when the next note should be triggered
int trigger = millis();

void setup() {

  // Create triangle wave and start it
  sine = new SinOsc(this);

  // Create the envelope
  env = new Env(this);
}

void draw() {

  if (mousePressed) {
    if (millis() > trigger) {

      sine.play(midiToFreq(65), 0.5);

      // The envelope gets triggered with the oscillator as input and the times and
      // levels we defined earlier
      env.play(sine, attackTime, sustainTime, sustainLevel, releaseTime);

      trigger = millis() + duration;
    }
  }
}

// This helper function calculates the respective frequency of a MIDI note
float midiToFreq(int note) {
  return (pow(2, ((note-69)/12.0))) * 440;
}
