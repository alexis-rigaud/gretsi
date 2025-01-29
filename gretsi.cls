% Classe LaTeX pour le colloque GRETSI

% Version log
%
% # v1.2 (2008/12/15)
%   ...
%
% # v1.3 (2023/01/25)
%   Simplification du fichier gretsi.cls
%   Langue : ajout d'une option dans la classe qui définit la langue du texte
%   Langue : suppression des deux fichiers (gretsifr.tex et gretsien.tex) pour un unique fichier (gretsi.fr)
%   Langue : les accents sont rentrés naturellement (à au lieu de \`a)
%   Langue : la commande \legende est supprimée (seule \caption est à utiliser)
%   Mise en page : utilisation du package geometry
%   Mise en page : numérotation des pages
%   Titre : simplification de la syntaxe + adresses électroniques intégrées en tant que lien hypertexte
%   Figures : utilisation du package graphicx (à la place de epsfig)
%   Tableaux : utilisation du package booktabs
%   Algorithmes : utilisation du package algorithm2e
%   Bibliographie : utilisation de \bibliography

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gretsi}[2023/01/25 v1.3]

% ===================================================================================== %

% Classe initiale

\LoadClass{article}

% ===================================================================================== %

% Packages

\RequirePackage{times}
\RequirePackage{microtype}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{hyperref}
\RequirePackage[french,english]{babel}

% ===================================================================================== %

% Gestion de la langue (options possibles : `francais` ou `french`, `english`)

\newif\if@french\@frenchfalse
\DeclareOption{francais}{\@frenchtrue}
\DeclareOption{french}{\@frenchtrue}
\DeclareOption{english}{\@frenchfalse}
\ExecuteOptions{francais}
\ProcessOptions\relax

\if@french
  \RequirePackage[ruled, french, frenchkw]{algorithm2e}
  \selectlanguage{french}
  \bibliographystyle{plain-fr}
\else
  \RequirePackage[ruled]{algorithm2e}
  \selectlanguage{english}
  \bibliographystyle{plain}
\fi

% ===================================================================================== %

% Options des packages & mise en page

\RequirePackage[a4paper, portrait, margin=14mm, bottom=24mm]{geometry}
\setlength{\columnsep}{10mm}
\setlength{\parindent}{1em}
\pagestyle{plain}
\sloppy

% ===================================================================================== %

% Résumés français et anglais

\newif\if@resfra\@resfrafalse

\long\def\resume#1{%
  \@resfratrue%
  \long\gdef\@resume{#1}%
}
\long\def\@resume{}

\long\def\abstract#1{%
  \long\gdef\@abstract{#1}%
}
\long\def\@abstract{}

% ===================================================================================== %

% Titre

\newcommand{\titre}{\title}
\newcommand{\auteurs}{\author}
\newcommand{\auteur}[4]{\href{mailto:#3}{#1 \textsc{#2}}\textsuperscript{#4}\hspace{1em}}
\long\def\affils#1{\long\gdef\@affils{#1}}
\newcommand{\affil}[2]{\\[5pt]\textsuperscript{#1}#2}

\def\maketitle{%
     \twocolumn[%
     %
     \if@french%
       \selectlanguage{french}%
     \else%
       \selectlanguage{english}%
     \fi%
     %
     \newpage%
     \null%
     \begin{center}%
        {\LARGE\textbf{\@title}\par\vskip25pt}%
        \@author\hspace*{-1em}%
        \@affils%
     \end{center}%
     \if@resfra%
       \bigskip
        \textbf{R\'esum\'e\enspace--\enspace}{\selectlanguage{french}\@resume\par}%
     \fi%
     \bigskip
     \textbf{Abstract\enspace--\enspace}{\selectlanguage{english}\@abstract\par}%
     \par\vskip25pt%
     ]%
     \if@french
       \selectlanguage{french}
     \else
       \selectlanguage{english}
     \fi
}

% ===================================================================================== %

\endinput
