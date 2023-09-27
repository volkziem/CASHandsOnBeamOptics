# CASHandsOnBeamOptics
MATLAB Hands-on software for Beam Optics tutorial at the CERN Accelerator School

------------------------------------------------------------------------

## Software installation before the school
---------------------------------------

### Matlab

If you already have **Matlab** installed on your laptop, no further
action is needed. All examples work well.

### Octave

Unless you already have **Octave** installed, please install it from the
repositories of your operating system. Otherwise follow the download
instructions for your operating system from the [Octave
website](https://octave.org/).

To be able to display three-dimensional histograms in octave, you need
to install the `statistics` package. In most linux distributions, it is
also available from the repositories. For all other systems, you need to
install the package from
<https://gnu-octave.github.io/packages/statistics/>. There is a link at
the top of that page which contains the command \"pkg install \...\"
that you need to execute from within a running octave. It will pull the
package from the octave webpage and install it for you. You only need to
install the package once, but before using it the first time *in each
session* you need to run `pkg load statistics` from within octave. You
can also put that line in your scripts.

That\'s all.

------------------------------------------------------------------------

Reading material 
----------------

[Beam optics primer using Octave or
Matlab](http://arxiv.org/abs/arXiv:1907.10987) from the arXiv. This is
also part of the CAS proceedings. We will follow this document during
the Octave/Matlab hands-on sessions and build our own beam optics code
in the process.

[Solution manual](vz_beam_optics_solutions.pdf), which is also part of
the CAS proceedings. Consult it, if you get stuck.

------------------------------------------------------------------------

Script files for the hands-on tutorial 
--------------------------------------

The script files from the appendix in the primer (right-click and save
where octave finds the file)

[beamoptics.m](2D/beamoptics.m)

[calcmat.m](2D/calcmat.m)

[R2beta.m](2D/R2beta.m)

[propagate\_beam.m](2D/propagate_beam.m)

[calcmat.m](2D/show_beam.m)

Additional files, mentioned in the text of the primer

[trak\_single\_particle.m](2D/trak_single_particle.m)

[periodic\_beam.m](2D/periodic_beam.m)

[match\_phase\_advance.m](2D/match_phase_advance.m)

The solutions to selected exercises from the solution manual (use only
if you get stuck)

[ex05.m](solutions/ex05.m)

[ex06.m](solutions/ex06.m)

[ex07.m](solutions/ex07.m)

[ex08.m](solutions/ex08.m)

[ex09.m](solutions/ex09.m)

[ex10.m](solutions/ex10.m)

[ex11.m](solutions/ex11.m)

[ex12.m](solutions/ex12.m)

[ex14.m](solutions/ex14.m)

[ex15.m](solutions/ex15.m)

[ex16.m](solutions/ex16.m)

[ex17.m](solutions/ex17.m)

[ex18.m](solutions/ex18.m)

[ex19.m](solutions/ex19.m)

[ex20.m](solutions/ex20.m)

[ex21.m](solutions/ex21.m)

[ex22.m](solutions/ex22.m)

[ex23.m](solutions/ex23.m)

[ex24.m](solutions/ex24.m)

[ex25.m](solutions/ex25.m)

[ex26.m](solutions/ex26.m)

[ex27.m](solutions/ex27.m)

[ex28.m](solutions/ex28.m)

[ex29.m](solutions/ex29.m) and the referenced function
[calcmat2.m](solutions/calcmat2.m) and [QQ.m](solutions/QQ.m)

[ex30.m](solutions/ex30.m)

[ex31.m](solutions/ex31.m) and the referenced function
[calcmat2.m](solutions/calcmat2.m) and [SB.m](solutions/SB.m)

[ex32.m](solutions/ex32.m)

[ex33.m](solutions/ex33.m), look inside the zip file 3D.zip from below

[ex39.m](solutions/ex39.m), look inside the zip file 4D.zip from below

Zip file [3D.zip](solutions/3D.zip) with contents of the subdirectory
\"3D\" that also contains solutions to exercises ex34.m, ex35.m, ex36.m,
ex37.m, and ex38.m.

Zip file [4D.zip](solutions/4D.zip) with contents of the subdirectory
\"4D\" that also contains solutions to exercises ex40.m, ex41.m, ex42.m,
and ex43.m.

