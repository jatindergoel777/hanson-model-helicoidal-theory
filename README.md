# Hanson's Model in Frequency Domain - Tonal Noise of Rotors in Uniform Inflow
This code is based on the Hanson's Paper titled "Helicoidal Surface Theory for Harmonic Noise of Propellers in the Far Field" with doi "https://doi.org/10.2514/3.50873". This code is meant to be used for tonal noise prediction of rotors with uniform inflow with propeller axis aligned with the inflow. This code is based on the frequence domain formultion and is only valid for far-field noise predictions.

## Requirements
This code has been developed and tested in Matlab 2021a. Though a higher or lower version of matlab then 2021a should be also ok, the authors cannot guarantee it.

## Installation
No additional installation are required  for the code except an acitvated installation of Matlab (preferably 2021a).

## Structure
In this repository you can find:
- `InputData/` directory containg the propeller geometry and loading input files
- The pdf file of the Reference paper "Helicoidal Surface Theory for Harmonic Noise of Propellers in the Far Field"

To use this code:
- Setup the case in **UserInput.m** file. 
- Set the number of harmonics to be calculated in **Mainfile.m** file by adjusting the parameter `m`.
- Evalaute your case by running **Mainfile.m** file in Matlab.

## Documentation
The theory and mathematical expressions behind the code can be found in the pdf file of the paper "Helicoidal Surface Theory for Harmonic Noise of Propellers in the Far Field" included in the repository.

## Author(s)
This software has been developed by
**Jatinder Goyal** ![ORCID logo](https://info.orcid.org/wp-content/uploads/2019/11/orcid_16x16.png) [0000-0001-7448-8617](https://orcid.org/0000-0001-7448-8617), Technische Universiteit Delft

## License
The contents in the `InputData/` directory are licensed under a **CC-BY 4.0** (see [CC-BY-4.0](LICENSES/CC-BY-4.0.txt) file). The source code, and any other file in this repository are licensed under an **Apache License v2.0** (see [Apache-License-v2.0](LICENSES/Apache-License-v2.0.txt) file).

Copyright notice:

Technische Universiteit Delft hereby disclaims all copyright interest in the program “Hanson's Model in Frequency Domain - Tonal Noise of Rotors in Uniform Inflow”. It is a matlab code to calculate tonal noise of rotors operating in an uniform inflow condition written by the Author(s).  
Henri Werij, Dean of Faculty of Aerospace Engineering, Technische Universiteit Delft.

&copy; 2023, J. Goyal

## References
- Hanson, D. B. (1980). Helicoidal surface theory for harmonic noise of propellers in the far field. AIAA journal, 18(10), 1213-1220.

## Cite this repository
If you use this software, please cite it as below or check out the CITATION.cff file.

**How to cite this repository**: Goyal, J., 2023. Hanson's Model in Frequency Domain - Tonal Noise of Rotors in Uniform Inflow. 4TU.ResearchData. Software. https://doi.org/10.4121/7da5aa45-e44b-4fa3-9407-8bf61e835d99 

## Would you like to contribute?

If you have any comments, feedback, or recommendations, feel free to **reach out** by sending an email to jatindergoel777@gmail.com

If you would like to contribute directly, you are welcome to **fork** this repository.

Thank you and enjoy!
