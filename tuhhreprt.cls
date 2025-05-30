\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tuhhreprt}
\RequirePackage{kvoptions}
\DeclareBoolOption[false]{nobcorignoretitle}
\DeclareBoolOption[false]{grayscalebody}
\DeclareBoolOption[false]{grayscaletitle}
\DeclareBoolOption[false]{fancyheadings}
\DeclareStringOption[scrbook]{baseclass}
\DeclareStringOption[TUHH]{titlestyle}
\DeclareStringOption[]{titleoptions}
\ProcessKeyvalOptions*
\LoadClassWithOptions{\tuhhreprt@baseclass}

\iftuhhreprt@fancyheadings
\RequirePackage[automark,headsepline,footsepline]{scrpage2}
\else
\RequirePackage[automark]{scrpage2}
\fi

\RequirePackage{graphicx}
\RequirePackageWithOptions{xcolor}
\RequirePackage{titlepage}
\ifx\tuhhreprt@titlestyle\@empty
\else
\TitlePageStyle[\tuhhreprt@titleoptions]{\tuhhreprt@titlestyle}
\fi

\pagestyle{scrheadings}
\iftuhhreprt@fancyheadings
	\newcommand{\twosideheadings}{\rehead{\leftmark}\lohead{\rightmark}}
	\newcommand{\onesideheadings}{\ihead{\leftmark}\chead{}}

	\iftuhhreprt@grayscalebody
		\ohead{\setlength{\unitlength}{0.5cm}}
	\else
		\ohead{\setlength{\unitlength}{0.5cm}}
	\fi
	
	\makeatletter
	\if@twoside\twosideheadings \else \onesideheadings \fi
	\makeatother
	
	\ifx\chapterpagestyle\undefined\else\renewcommand*{\chapterpagestyle}{scrheadings}\fi
	\ifx\partpagestyle\undefined\else\renewcommand*{\partpagestyle}{scrheadings}\fi
	\ifx\indexpagestyle\undefined\else\renewcommand*{\indexpagestyle}{scrheadings}\fi
	\ifx\chapterheadstartvskip\undefined\else\renewcommand{\chapterheadstartvskip}{\vspace *{-\baselineskip }}\fi
\else
\fi


\endinput
