SuperDirt.start;
MIDIClient.init;

s.waitForBoot {
    ~midiOut = MIDIOut.newByName("YOUR_DEVICE_HERE", "YOUR_DEVICE_HERE");
    ~midiOut.latency = 0;
    ~dirt.soundLibrary.addMIDI(\midi, ~midiOut);
};