# LCLS-I Drift Correction

This repository contains the LCLS-I drift correction scripts and monitoring GUI used for the XCS, MFX, and CXI hutches.

The drift correction process uses Time Tool and EPICS signals to monitor timing drift and apply corrections when the configured beam, signal quality, and system-state conditions are valid. The PyDM GUI provides status, signal quality, correction, and configuration readbacks.

## Repository Contents

• 'Drift_Correction.py' - drift correction script
• 'Drift_Correction_GUI.py' - PyDM monitoring and configuration GUI
• 'watchdog3.py' - watchdog helper used by the correction script
