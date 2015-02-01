" Vim syntax file
" Language:             Octave (modified to Matlab)
" Maintainer:           Rik <rik@nomad.inbox5.com>
" Original Maintainers: Jaroslav Hajek <highegg@gmail.com>
"                       Francisco Castro <fcr@adinet.com.uy>
"                       Preben 'Peppe' Guldberg <peppe-vim@wielders.org>
" Original Author: Mario Eusebio
" Last Change: 11 Jan 2012
" Syntax matched to Octave Release: 3.6.0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Use case sensitive matching of keywords
syn case match

" Stop keywords embedded in structures from lighting up
" For example, mystruct.length = 1 should not highlight length.
" WARNING: beginning of word pattern \< will no longer match '.'
setlocal iskeyword +=.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax group definitions for Octave
syn keyword matlabBeginKeyword  for parfor function if switch
syn keyword matlabBeginKeyword  try unwind_protect while do
syn keyword matlabEndKeyword    end endfor endparfor endfunction endif endswitch
syn keyword matlabEndKeyword    end_try_catch end_unwind_protect endwhile until
syn keyword matlabElseKeyword   case catch else elseif otherwise
syn keyword matlabElseKeyword   unwind_protect_cleanup

syn keyword matlabStatement  break continue global persistent return

syn keyword matlabVarKeyword varargin varargout

syn keyword matlabReserved  __FILE__ __LINE__ static
syn keyword matlabReserved  classdef enumeration events methods properties
syn keyword matlabReserved  endclassdef endenumeration endevents endmethods
syn keyword matlabReserved  endproperties

" List of commands (these don't require a parenthesis to invoke)
syn keyword matlabCommand contained  cd chdir clear close dbcont dbquit dbstep
syn keyword matlabCommand contained  demo diary doc echo edit edit_history
syn keyword matlabCommand contained  example format help history hold ishold
syn keyword matlabCommand contained  load lookfor ls mkoctfile more pkg run
syn keyword matlabCommand contained  run_history save shg test type what which
syn keyword matlabCommand contained  who whos

" List of functions which set internal variables
syn keyword matlabSetVarFun contained  EDITOR EXEC_PATH F_SETFD F_SETFL I
syn keyword matlabSetVarFun contained  IMAGE_PATH Inf J NA NaN O_APPEND O_ASYNC
syn keyword matlabSetVarFun contained  PAGER PAGER_FLAGS PS1 PS2 PS4
syn keyword matlabSetVarFun contained  __error_text__
syn keyword matlabSetVarFun contained  allow_noninteger_range_as_index ans argv
syn keyword matlabSetVarFun contained  beep_on_error completion_append_char
syn keyword matlabSetVarFun contained  confirm_recursive_rmdir
syn keyword matlabSetVarFun contained  crash_dumps_octave_core debug_on_error
syn keyword matlabSetVarFun contained  debug_on_interrupt debug_on_warning
syn keyword matlabSetVarFun contained  default_save_options
syn keyword matlabSetVarFun contained  do_braindead_shortcircuit_evaluation
syn keyword matlabSetVarFun contained  doc_cache_file e echo_executing_commands
syn keyword matlabSetVarFun contained  eps error_text false filemarker
syn keyword matlabSetVarFun contained  fixed_point_format gnuplot_binary
syn keyword matlabSetVarFun contained  gui_mode history_control history_file
syn keyword matlabSetVarFun contained  history_size
syn keyword matlabSetVarFun contained  history_timestamp_format_string i
syn keyword matlabSetVarFun contained  ignore_function_time_stamp inf info_file
syn keyword matlabSetVarFun contained  info_program j ls_command
syn keyword matlabSetVarFun contained  makeinfo_program max_recursion_depth
syn keyword matlabSetVarFun contained  missing_function_hook mouse_wheel_zoom
syn keyword matlabSetVarFun contained  nan nargin nargout octave_core_file_limit
syn keyword matlabSetVarFun contained  octave_core_file_name
syn keyword matlabSetVarFun contained  octave_core_file_options
syn keyword matlabSetVarFun contained  optimize_subsasgn_calls
syn keyword matlabSetVarFun contained  output_max_field_width output_precision
syn keyword matlabSetVarFun contained  page_output_immediately
syn keyword matlabSetVarFun contained  page_screen_output pathsep pi
syn keyword matlabSetVarFun contained  print_empty_dimensions
syn keyword matlabSetVarFun contained  print_struct_array_contents
syn keyword matlabSetVarFun contained  program_invocation_name program_name
syn keyword matlabSetVarFun contained  realmax realmin
syn keyword matlabSetVarFun contained  save_header_format_string save_precision
syn keyword matlabSetVarFun contained  saving_history sighup_dumps_octave_core
syn keyword matlabSetVarFun contained  sigterm_dumps_octave_core
syn keyword matlabSetVarFun contained  silent_functions sparse_auto_mutate
syn keyword matlabSetVarFun contained  split_long_rows string_fill_char
syn keyword matlabSetVarFun contained  struct_levels_to_print
syn keyword matlabSetVarFun contained  suppress_verbose_help_message svd_driver
syn keyword matlabSetVarFun contained  true whos_line_format

" List of functions which query internal variables
" Excluded i,j from list above because they are often used as loop variables
" They will be highlighted appropriately by the rule which matches numbers
syn keyword matlabVariable contained  EDITOR EXEC_PATH F_SETFD F_SETFL I
syn keyword matlabVariable contained  IMAGE_PATH Inf J NA NaN O_APPEND O_ASYNC
syn keyword matlabVariable contained  PAGER PAGER_FLAGS PS1 PS2 PS4
syn keyword matlabVariable contained  __error_text__
syn keyword matlabVariable contained  allow_noninteger_range_as_index ans argv
syn keyword matlabVariable contained  beep_on_error completion_append_char
syn keyword matlabVariable contained  confirm_recursive_rmdir
syn keyword matlabVariable contained  crash_dumps_octave_core debug_on_error
syn keyword matlabVariable contained  debug_on_interrupt debug_on_warning
syn keyword matlabVariable contained  default_save_options
syn keyword matlabVariable contained  do_braindead_shortcircuit_evaluation
syn keyword matlabVariable contained  doc_cache_file e echo_executing_commands
syn keyword matlabVariable contained  eps error_text false filemarker
syn keyword matlabVariable contained  fixed_point_format gnuplot_binary
syn keyword matlabVariable contained  gui_mode history_control history_file
syn keyword matlabVariable contained  history_size
syn keyword matlabVariable contained  history_timestamp_format_string
syn keyword matlabVariable contained  ignore_function_time_stamp inf info_file
syn keyword matlabVariable contained  info_program ls_command
syn keyword matlabVariable contained  makeinfo_program max_recursion_depth
syn keyword matlabVariable contained  missing_function_hook mouse_wheel_zoom
syn keyword matlabVariable contained  nan nargin nargout octave_core_file_limit
syn keyword matlabVariable contained  octave_core_file_name
syn keyword matlabVariable contained  octave_core_file_options
syn keyword matlabVariable contained  optimize_subsasgn_calls
syn keyword matlabVariable contained  output_max_field_width output_precision
syn keyword matlabVariable contained  page_output_immediately
syn keyword matlabVariable contained  page_screen_output pathsep pi
syn keyword matlabVariable contained  print_empty_dimensions
syn keyword matlabVariable contained  print_struct_array_contents
syn keyword matlabVariable contained  program_invocation_name program_name
syn keyword matlabVariable contained  realmax realmin
syn keyword matlabVariable contained  save_header_format_string save_precision
syn keyword matlabVariable contained  saving_history sighup_dumps_octave_core
syn keyword matlabVariable contained  sigterm_dumps_octave_core
syn keyword matlabVariable contained  silent_functions sparse_auto_mutate
syn keyword matlabVariable contained  split_long_rows string_fill_char
syn keyword matlabVariable contained  struct_levels_to_print
syn keyword matlabVariable contained  suppress_verbose_help_message svd_driver
syn keyword matlabVariable contained  true whos_line_format

" Read-only variables
syn keyword matlabVariable contained  F_DUPFD F_GETFD F_GETFL OCTAVE_HOME
syn keyword matlabVariable contained  OCTAVE_VERSION O_CREAT O_EXCL O_NONBLOCK
syn keyword matlabVariable contained  O_RDONLY O_RDWR O_SYNC O_TRUNC O_WRONLY
syn keyword matlabVariable contained  P_tmpdir SEEK_CUR SEEK_END SEEK_SET
syn keyword matlabVariable contained  WCONTINUE WCOREDUMP WEXITSTATUS
syn keyword matlabVariable contained  WIFCONTINUED WIFEXITED WIFSIGNALED
syn keyword matlabVariable contained  WIFSTOPPED WNOHANG WSTOPSIG WTERMSIG
syn keyword matlabVariable contained  WUNTRACED matlabroot pwd stderr stdin
syn keyword matlabVariable contained  stdout

" List of functions
syn keyword matlabFunction contained  SIG S_ISBLK S_ISCHR S_ISDIR S_ISFIFO
syn keyword matlabFunction contained  S_ISLNK S_ISREG S_ISSOCK ___go_uimenu__
syn keyword matlabFunction contained  __accumarray_max__ __accumarray_min__
syn keyword matlabFunction contained  __accumarray_sum__ __accumdim_sum__
syn keyword matlabFunction contained  __all_opts__ __builtins__
syn keyword matlabFunction contained  __calc_dimensions__ __contourc__
syn keyword matlabFunction contained  __current_scope__ __delaunayn__
syn keyword matlabFunction contained  __dispatch__ __display_tokens__
syn keyword matlabFunction contained  __dsearchn__ __dump_symtab_info__ __end__
syn keyword matlabFunction contained  __finish__ __fltk_maxtime__
syn keyword matlabFunction contained  __fltk_redraw__ __fltk_uigetfile__
syn keyword matlabFunction contained  __ftp__ __ftp_ascii__ __ftp_binary__
syn keyword matlabFunction contained  __ftp_close__ __ftp_cwd__ __ftp_delete__
syn keyword matlabFunction contained  __ftp_dir__ __ftp_mget__ __ftp_mkdir__
syn keyword matlabFunction contained  __ftp_mode__ __ftp_mput__ __ftp_pwd__
syn keyword matlabFunction contained  __ftp_rename__ __ftp_rmdir__ __get__
syn keyword matlabFunction contained  __glpk__ __gnuplot_drawnow__ __go_axes__
syn keyword matlabFunction contained  __go_axes_init__ __go_delete__
syn keyword matlabFunction contained  __go_execute_callback__ __go_figure__
syn keyword matlabFunction contained  __go_figure_handles__ __go_handles__
syn keyword matlabFunction contained  __go_hggroup__ __go_image__ __go_line__
syn keyword matlabFunction contained  __go_patch__ __go_surface__ __go_text__
syn keyword matlabFunction contained  __go_uicontextmenu__ __go_uicontrol_
syn keyword matlabFunction contained  __go_uipanel__ __go_uipushtool__
syn keyword matlabFunction contained  __go_uitoggletool__ __go_uitoolbar__
syn keyword matlabFunction contained  __gud_mode__ __image_pixel_size__
syn keyword matlabFunction contained  __init_fltk__ __init_gnuplot__
syn keyword matlabFunction contained  __is_handle_visible__ __isa_parent__
syn keyword matlabFunction contained  __keywords__ __lexer_debug_flag__
syn keyword matlabFunction contained  __lin_interpn__ __list_functions__
syn keyword matlabFunction contained  __magick_finfo__ __magick_format_list__
syn keyword matlabFunction contained  __magick_read__ __magick_write__
syn keyword matlabFunction contained  __makeinfo__ __operators__
syn keyword matlabFunction contained  __parent_classes__ __parser_debug_flag__
syn keyword matlabFunction contained  __pathorig__ __pchip_deriv__
syn keyword matlabFunction contained  __plt_get_axis_arg__ __profiler_data__
syn keyword matlabFunction contained  __profiler_enable__ __profiler_reset__
syn keyword matlabFunction contained  __qp__ __request_drawnow__
syn keyword matlabFunction contained  __sort_rows_idx__ __token_count__
syn keyword matlabFunction contained  __varval__ __version_info__ __voronoi__
syn keyword matlabFunction contained  __which__ abs accumarray accumdim acos
syn keyword matlabFunction contained  acosd acosh acot acotd acoth acsc acscd
syn keyword matlabFunction contained  acsch add_input_event_hook addlistener
syn keyword matlabFunction contained  addpath addpref addproperty addtodate
syn keyword matlabFunction contained  airy all allchild amd ancestor and angle
syn keyword matlabFunction contained  anova any arch_fit arch_rnd arch_test
syn keyword matlabFunction contained  area arg argnames arma_rnd arrayfun
syn keyword matlabFunction contained  asctime asec asecd asech asin asind asinh
syn keyword matlabFunction contained  assert assignin atan atan2 atand atanh
syn keyword matlabFunction contained  atexit autocor autocov autoload
syn keyword matlabFunction contained  autoreg_matrix autumn
syn keyword matlabFunction contained  available_graphics_toolkits axes axis
syn keyword matlabFunction contained  balance bar barh bartlett bartlett_test
syn keyword matlabFunction contained  base2dec beep bessel besselh besseli
syn keyword matlabFunction contained  besselj besselk bessely beta betacdf
syn keyword matlabFunction contained  betai betainc betainv betaln betapdf
syn keyword matlabFunction contained  betarnd bicg bicgstab bicubic bin2dec
syn keyword matlabFunction contained  bincoeff binocdf binoinv binopdf binornd
syn keyword matlabFunction contained  bitand bitcmp bitget bitmax bitor bitpack
syn keyword matlabFunction contained  bitset bitshift bitunpack bitxor blackman
syn keyword matlabFunction contained  blanks blkdiag blkmm bone box brighten
syn keyword matlabFunction contained  bsxfun bug_report builtin bunzip2 bzip2
syn keyword matlabFunction contained  calendar canonicalize_file_name cart2pol
syn keyword matlabFunction contained  cart2sph cast cat cauchy_cdf cauchy_inv
syn keyword matlabFunction contained  cauchy_pdf cauchy_rnd caxis cbrt ccolamd
syn keyword matlabFunction contained  ceil cell cell2mat cell2struct celldisp
syn keyword matlabFunction contained  cellfun cellidx cellindexmat cellslices
syn keyword matlabFunction contained  cellstr center cgs char chi2cdf chi2inv
syn keyword matlabFunction contained  chi2pdf chi2rnd
syn keyword matlabFunction contained  chisquare_test_homogeneity
syn keyword matlabFunction contained  chisquare_test_independence chol chol2inv
syn keyword matlabFunction contained  choldelete cholinsert cholinv cholshift
syn keyword matlabFunction contained  cholupdate chop circshift cla clabel
syn keyword matlabFunction contained  class clc clf clg clock cloglog closereq
syn keyword matlabFunction contained  colamd colloc colon colorbar colormap
syn keyword matlabFunction contained  colperm colstyle columns comet comet3
syn keyword matlabFunction contained  comma command_line_path common_size
syn keyword matlabFunction contained  commutation_matrix compan
syn keyword matlabFunction contained  compare_versions compass
syn keyword matlabFunction contained  completion_matches complex computer cond
syn keyword matlabFunction contained  condest conj contour contour3 contourc
syn keyword matlabFunction contained  contourf contrast conv conv2 convhull
syn keyword matlabFunction contained  convhulln convn cool copper copyfile cor
syn keyword matlabFunction contained  cor_test corr corrcoef cos cosd cosh cot
syn keyword matlabFunction contained  cotd coth cov cplxpair cputime cquad
syn keyword matlabFunction contained  cross csc cscd csch cstrcat csvread
syn keyword matlabFunction contained  csvwrite csymamd ctime ctranspose cummax
syn keyword matlabFunction contained  cummin cumprod cumsum cumtrapz curl cut
syn keyword matlabFunction contained  cylinder daspect daspk daspk_options
syn keyword matlabFunction contained  dasrt dasrt_options dassl dassl_options
syn keyword matlabFunction contained  date datenum datestr datetick datevec
syn keyword matlabFunction contained  dbclear dbdown dblquad dbnext dbstack
syn keyword matlabFunction contained  dbstatus dbstop dbtype dbup dbwhere deal
syn keyword matlabFunction contained  deblank debug dec2base dec2bin dec2hex
syn keyword matlabFunction contained  deconv del2 delaunay delaunay3 delaunayn
syn keyword matlabFunction contained  delete dellistener det detrend diag diff
syn keyword matlabFunction contained  diffpara diffuse dir discrete_cdf
syn keyword matlabFunction contained  discrete_inv discrete_pdf discrete_rnd
syn keyword matlabFunction contained  disp dispatch display divergence dlmread
syn keyword matlabFunction contained  dlmwrite dmperm do_string_escapes dos dot
syn keyword matlabFunction contained  double drawnow dsearch dsearchn
syn keyword matlabFunction contained  dump_prefs dup2 duplication_matrix
syn keyword matlabFunction contained  durbinlevinson eig eigs ellipsoid
syn keyword matlabFunction contained  empirical_cdf empirical_inv empirical_pdf
syn keyword matlabFunction contained  empirical_rnd endgrent endpwent eomday eq
syn keyword matlabFunction contained  erf erfc erfcx erfinv errno errno_list
syn keyword matlabFunction contained  error errorbar etime etree etreeplot eval
syn keyword matlabFunction contained  evalin exec exist exit exp expcdf expinv
syn keyword matlabFunction contained  expm expm1 exppdf exprnd eye ezcontour
syn keyword matlabFunction contained  ezcontourf ezmesh ezmeshc ezplot ezplot3
syn keyword matlabFunction contained  ezpolar ezsurf ezsurfc f_test_regression
syn keyword matlabFunction contained  factor factorial fail fcdf fclear fclose
syn keyword matlabFunction contained  fcntl fdisp feather feof ferror feval
syn keyword matlabFunction contained  fflush fft fft2 fftconv fftfilt fftn
syn keyword matlabFunction contained  fftshift fftw fgetl fgets fieldnames
syn keyword matlabFunction contained  figure file_in_loadpath file_in_path
syn keyword matlabFunction contained  fileattrib fileparts fileread filesep
syn keyword matlabFunction contained  fill filter filter2 find find_dir_in_path
syn keyword matlabFunction contained  findall findobj findstr finite finv fix
syn keyword matlabFunction contained  flag flipdim fliplr flipud floor fminbnd
syn keyword matlabFunction contained  fminunc fmod fnmatch fopen fork formula
syn keyword matlabFunction contained  fpdf fplot fprintf fputs fractdiff fread
syn keyword matlabFunction contained  freport freqz freqz_plot frewind frnd
syn keyword matlabFunction contained  fscanf fseek fskipl fsolve fstat ftell
syn keyword matlabFunction contained  full fullfile func2str functions fwrite
syn keyword matlabFunction contained  fzero gamcdf gaminv gamma gammai gammainc
syn keyword matlabFunction contained  gammaln gampdf gamrnd gca gcbf gcbo gcd
syn keyword matlabFunction contained  gcf ge gen_doc_cache genpath genvarname
syn keyword matlabFunction contained  geocdf geoinv geopdf geornd get
syn keyword matlabFunction contained  get_first_help_sentence get_help_text
syn keyword matlabFunction contained  get_help_text_from_file getappdata
syn keyword matlabFunction contained  getegid getenv geteuid getfield getgid
syn keyword matlabFunction contained  getgrent getgrgid getgrnam gethostname
syn keyword matlabFunction contained  getpgrp getpid getppid getpwent getpwnam
syn keyword matlabFunction contained  getpwuid getrusage getuid ginput givens
syn keyword matlabFunction contained  glob glpk glpkmex gls gmap40 gmres gmtime
syn keyword matlabFunction contained  gplot gradient graphics_toolkit gray
syn keyword matlabFunction contained  gray2ind grid griddata griddata3
syn keyword matlabFunction contained  griddatan gt gtext guidata guihandles
syn keyword matlabFunction contained  gunzip gzip hadamard hamming hankel
syn keyword matlabFunction contained  hanning hess hex2dec hex2num hggroup
syn keyword matlabFunction contained  hidden hilb hist histc home horzcat hot
syn keyword matlabFunction contained  hotelling_test hotelling_test_2 housh hsv
syn keyword matlabFunction contained  hsv2rgb hurst hygecdf hygeinv hygepdf
syn keyword matlabFunction contained  hygernd hypot idivide ifelse ifft ifft2
syn keyword matlabFunction contained  ifftn ifftshift imag image imagesc
syn keyword matlabFunction contained  imfinfo imread imshow imwrite ind2gray
syn keyword matlabFunction contained  ind2rgb ind2sub index inferiorto info
syn keyword matlabFunction contained  inline inpolygon input inputname int16
syn keyword matlabFunction contained  int2str int32 int64 int8 interp1 interp1q
syn keyword matlabFunction contained  interp2 interp3 interpft interpn
syn keyword matlabFunction contained  intersect intmax intmin intwarning inv
syn keyword matlabFunction contained  inverse invhilb ipermute iqr
syn keyword matlabFunction contained  is_absolute_filename is_dq_string
syn keyword matlabFunction contained  is_duplicate_entry is_function_handle
syn keyword matlabFunction contained  is_global is_leap_year
syn keyword matlabFunction contained  is_rooted_relative_filename is_sq_string
syn keyword matlabFunction contained  is_valid_file_id isa isalnum isalpha
syn keyword matlabFunction contained  isappdata isargout isascii isbool iscell
syn keyword matlabFunction contained  iscellstr ischar iscntrl iscolumn
syn keyword matlabFunction contained  iscomplex isdebugmode isdefinite
syn keyword matlabFunction contained  isdeployed isdigit isdir isempty isequal
syn keyword matlabFunction contained  isequalwithequalnans isfield isfigure
syn keyword matlabFunction contained  isfinite isfloat isglobal isgraph
syn keyword matlabFunction contained  ishandle ishermitian ishghandle isieee
syn keyword matlabFunction contained  isindex isinf isinteger iskeyword
syn keyword matlabFunction contained  isletter islogical islower ismac ismatrix
syn keyword matlabFunction contained  ismember ismethod isna isnan isnull
syn keyword matlabFunction contained  isnumeric isobject isocolors isonormals
syn keyword matlabFunction contained  isosurface ispc ispref isprime isprint
syn keyword matlabFunction contained  isprop ispunct isreal isrow isscalar
syn keyword matlabFunction contained  issorted isspace issparse issquare isstr
syn keyword matlabFunction contained  isstrprop isstruct issymmetric isunix
syn keyword matlabFunction contained  isupper isvarname isvector isxdigit jet
syn keyword matlabFunction contained  kbhit kendall keyboard kill
syn keyword matlabFunction contained  kolmogorov_smirnov_cdf
syn keyword matlabFunction contained  kolmogorov_smirnov_test
syn keyword matlabFunction contained  kolmogorov_smirnov_test_2 kron
syn keyword matlabFunction contained  kruskal_wallis_test krylov krylovb
syn keyword matlabFunction contained  kurtosis laplace_cdf laplace_inv
syn keyword matlabFunction contained  laplace_pdf laplace_rnd lasterr lasterror
syn keyword matlabFunction contained  lastwarn lcm ldivide le legend legendre
syn keyword matlabFunction contained  length lgamma license lin2mu line link
syn keyword matlabFunction contained  linkprop linspace list_in_columns
syn keyword matlabFunction contained  list_primes loadaudio
syn keyword matlabFunction contained  loaded_graphics_toolkits loadobj
syn keyword matlabFunction contained  localtime log log10 log1p log2 logical
syn keyword matlabFunction contained  logistic_cdf logistic_inv logistic_pdf
syn keyword matlabFunction contained  logistic_regression logistic_rnd logit
syn keyword matlabFunction contained  loglog loglogerr logm logncdf logninv
syn keyword matlabFunction contained  lognpdf lognrnd logspace lookup lower
syn keyword matlabFunction contained  lsode lsode_options lsqnonneg lstat lt lu
syn keyword matlabFunction contained  luinc luupdate magic mahalanobis
syn keyword matlabFunction contained  make_absolute_filename manova mat2cell
syn keyword matlabFunction contained  mat2str matrix_type max mcnemar_test
syn keyword matlabFunction contained  md5sum mean meansq median menu merge mesh
syn keyword matlabFunction contained  meshc meshgrid meshz methods mex mexext
syn keyword matlabFunction contained  mfilename mgorth min minus mislocked
syn keyword matlabFunction contained  mkdir mkfifo mkpp mkstemp mktime mldivide
syn keyword matlabFunction contained  mlock mod mode moment movefile mpoles
syn keyword matlabFunction contained  mpower mrdivide mtimes mu2lin munlock
syn keyword matlabFunction contained  namelengthmax nargchk narginchk
syn keyword matlabFunction contained  nargoutchk native_float_format nbincdf
syn keyword matlabFunction contained  nbininv nbinpdf nbinrnd nchoosek ndgrid
syn keyword matlabFunction contained  ndims ne newplot news nextpow2 nfields
syn keyword matlabFunction contained  nnz nonzeros norm normcdf normest norminv
syn keyword matlabFunction contained  normpdf normrnd not now nproc nth_element
syn keyword matlabFunction contained  nthargout nthroot ntsc2rgb null num2cell
syn keyword matlabFunction contained  num2hex num2str numel nzmax ocean
syn keyword matlabFunction contained  octave_config_info octave_tmp_file_name
syn keyword matlabFunction contained  ols onCleanup onenormest ones optimget
syn keyword matlabFunction contained  optimset or orderfields orient orth pack
syn keyword matlabFunction contained  paren pareto parseparams pascal patch
syn keyword matlabFunction contained  path pathdef pause pbaspect pcg pchip
syn keyword matlabFunction contained  pclose pcolor pcr peaks periodogram perl
syn keyword matlabFunction contained  perms permute perror pie pie3 pink pinv
syn keyword matlabFunction contained  pipe planerot playaudio plot plot3
syn keyword matlabFunction contained  plotmatrix plotyy plus poisscdf poissinv
syn keyword matlabFunction contained  poisspdf poissrnd pol2cart polar poly
syn keyword matlabFunction contained  polyaffine polyarea polyder polyderiv
syn keyword matlabFunction contained  polyfit polygcd polyint polyout
syn keyword matlabFunction contained  polyreduce polyval polyvalm popen popen2
syn keyword matlabFunction contained  postpad pow2 power powerset ppder ppint
syn keyword matlabFunction contained  ppjumps ppplot ppval pqpnonneg prctile
syn keyword matlabFunction contained  prepad primes print print_usage printf
syn keyword matlabFunction contained  prism probit prod profexplore profile
syn keyword matlabFunction contained  profshow prop_test_2 putenv puts python
syn keyword matlabFunction contained  qp qqplot qr qrdelete qrinsert qrshift
syn keyword matlabFunction contained  qrupdate quad quad_options quadcc quadgk
syn keyword matlabFunction contained  quadl quadv quantile quit quiver quiver3
syn keyword matlabFunction contained  qz qzhess rainbow rand rande randg randi
syn keyword matlabFunction contained  randn randp randperm range rank ranks rat
syn keyword matlabFunction contained  rats rcond rdivide
syn keyword matlabFunction contained  re_read_readline_init_file
syn keyword matlabFunction contained  read_readline_init_file readdir readlink
syn keyword matlabFunction contained  real reallog realpow realsqrt record
syn keyword matlabFunction contained  rectint recycle refresh refreshdata
syn keyword matlabFunction contained  regexp regexpi regexprep regexptranslate
syn keyword matlabFunction contained  register_graphics_toolkit rehash rem
syn keyword matlabFunction contained  remove_input_event_hook rename repelems
syn keyword matlabFunction contained  replot repmat reset reshape residue
syn keyword matlabFunction contained  resize restoredefaultpath rethrow rgb2hsv
syn keyword matlabFunction contained  rgb2ind rgb2ntsc ribbon rindex rmappdata
syn keyword matlabFunction contained  rmdir rmfield rmpath rmpref roots rose
syn keyword matlabFunction contained  rosser rot90 rotdim round roundb rows
syn keyword matlabFunction contained  rref rsf2csf run_count run_test rundemos
syn keyword matlabFunction contained  runlength runtests saveas saveaudio
syn keyword matlabFunction contained  saveimage saveobj savepath scanf scatter
syn keyword matlabFunction contained  scatter3 schur sec secd sech semicolon
syn keyword matlabFunction contained  semilogx semilogxerr semilogy semilogyerr
syn keyword matlabFunction contained  set setappdata setaudio setdiff setenv
syn keyword matlabFunction contained  setfield setgrent setpref setpwent setstr
syn keyword matlabFunction contained  setxor shading shell_cmd shift shiftdim
syn keyword matlabFunction contained  sign sign_test sin sinc sind sinetone
syn keyword matlabFunction contained  sinewave single sinh size size_equal
syn keyword matlabFunction contained  sizemax sizeof skewness sleep slice
syn keyword matlabFunction contained  sombrero sort sortrows source spalloc
syn keyword matlabFunction contained  sparse spaugment spconvert spdiags
syn keyword matlabFunction contained  spearman spectral_adf spectral_xdf
syn keyword matlabFunction contained  specular speed spencer speye spfun
syn keyword matlabFunction contained  sph2cart sphere spinmap spline spones
syn keyword matlabFunction contained  spparms sprand sprandn sprandsym sprank
syn keyword matlabFunction contained  sprintf spstats spy sqp sqrt sqrtm
syn keyword matlabFunction contained  squeeze sscanf stairs stat statistics std
syn keyword matlabFunction contained  stdnormal_cdf stdnormal_inv stdnormal_pdf
syn keyword matlabFunction contained  stdnormal_rnd stem stem3 stft str2double
syn keyword matlabFunction contained  str2func str2num strcat strchr strcmp
syn keyword matlabFunction contained  strcmpi strerror strfind strftime strjust
syn keyword matlabFunction contained  strmatch strncmp strncmpi strptime
syn keyword matlabFunction contained  strread strrep strsplit strtok strtrim
syn keyword matlabFunction contained  strtrunc struct struct2cell structfun
syn keyword matlabFunction contained  strvcat studentize sub2ind subplot
syn keyword matlabFunction contained  subsasgn subsindex subspace subsref
syn keyword matlabFunction contained  substr substruct sum summer sumsq
syn keyword matlabFunction contained  superiorto surf surface surfc surfl
syn keyword matlabFunction contained  surfnorm svd svds swapbytes syl
syn keyword matlabFunction contained  sylvester_matrix symamd symbfact symlink
syn keyword matlabFunction contained  symrcm symvar synthesis system t_test
syn keyword matlabFunction contained  t_test_2 t_test_regression table tan tand
syn keyword matlabFunction contained  tanh tar tcdf tempdir tempname
syn keyword matlabFunction contained  terminal_size text textread textscan tic
syn keyword matlabFunction contained  tilde_expand time times tinv title
syn keyword matlabFunction contained  tmpfile tmpnam toascii toc toeplitz
syn keyword matlabFunction contained  tolower toupper tpdf trace transpose
syn keyword matlabFunction contained  trapz treelayout treeplot tril trimesh
syn keyword matlabFunction contained  triplequad triplot trisurf triu trnd
syn keyword matlabFunction contained  tsearch tsearchn typecast typeinfo u_test
syn keyword matlabFunction contained  uicontextmenu uicontrol uigetdir
syn keyword matlabFunction contained  uigetfile uimenu uint16 uint32 uint64
syn keyword matlabFunction contained  uint8 uipanel uipushtool uiputfile
syn keyword matlabFunction contained  uiresume uitoggletool uitoolbar uiwait
syn keyword matlabFunction contained  umask uminus uname undo_string_escapes
syn keyword matlabFunction contained  unidcdf unidinv unidpdf unidrnd unifcdf
syn keyword matlabFunction contained  unifinv unifpdf unifrnd unimplemented
syn keyword matlabFunction contained  union unique unix unlink unmkpp unpack
syn keyword matlabFunction contained  untabify untar unwrap unzip uplus upper
syn keyword matlabFunction contained  urlread urlwrite usage usejava usleep
syn keyword matlabFunction contained  validatestring values vander var var_test
syn keyword matlabFunction contained  vec vech vectorize ver version vertcat
syn keyword matlabFunction contained  view voronoi voronoin waitbar waitfor
syn keyword matlabFunction contained  waitforbuttonpress waitpid warning
syn keyword matlabFunction contained  warning_ids warranty wavread wavwrite
syn keyword matlabFunction contained  wblcdf wblinv wblpdf wblrnd weekday
syn keyword matlabFunction contained  weibcdf weibinv weibpdf weibrnd
syn keyword matlabFunction contained  welch_test white whitebg wienrnd
syn keyword matlabFunction contained  wilcoxon_test wilkinson winter xlabel
syn keyword matlabFunction contained  xlim xor yes_or_no ylabel ylim yulewalker
syn keyword matlabFunction contained  z_test z_test_2 zeros zip zlabel zlim
syn keyword matlabFunction contained  zscore


" Add functions defined in .m file being read to list of highlighted functions
function! s:CheckForFunctions()
  let i = 1
  while i <= line('$')
    let line = getline(i)
    " Only look for functions at start of line.
    " Commented function, '# function', will not trigger as match returns 3
    if match(line, '\Cfunction') == 0
      let line = substitute(line, '\vfunction *([^(]*\= *)?', '', '')
      let nfun = matchstr(line, '\v^\h\w*')
      if !empty(nfun)
        execute "syn keyword matlabFunction" nfun
      endif
    " Include anonymous functions 'func = @(...)'.
    " Use contained keyword to prevent highlighting on LHS of '='
    elseif match(line, '\<\(\h\w*\)\s*=\s*@\s*(') != -1
      let list = matchlist(line, '\<\(\h\w*\)\s*=\s*@\s*(')
      let nfun = list[1]
      if !empty(nfun)
        execute "syn keyword matlabFunction contained" nfun
      endif
    endif
    let i = i + 1
  endwhile
endfunction

call s:CheckForFunctions()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Define clusters for ease of writing subsequent rules
syn cluster AllFuncVarCmd contains=matlabVariable,matlabFunction,matlabCommand
syn cluster AllFuncSetCmd contains=matlabSetVarFun,matlabFunction,matlabCommand

" Switch highlighting of variables based on coding use.
" Query -> Constant, Set -> Function
" order of items is is important here
syn match matlabQueryVar "\<\h\w*[^(]"me=e-1  contains=@AllFuncVarCmd
syn match matlabSetVar   "\<\h\w*\s*("me=e-1  contains=@AllFuncSetCmd
syn match matlabQueryVar "\<\h\w*\s*\((\s*)\)\@="  contains=@AllFuncVarCmd

" Don't highlight Octave keywords on LHS of '=', these are user vars
syn match matlabUserVar  "\<\h\w*\ze[^<>!~="']\{-}==\@!"
syn match matlabUserVar  "\<\h\w*\s*[<>!~=]=" contains=matlabVariable

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Errors (placed early so they may be overriden by more specific rules
" Struct with nonvalid identifier starting with number (Example: 1.a or a.1b)
syn region matlabError  start="\<\d\+\(\w*\.\)\@="  end="[^0-9]"he=s-1 oneline
syn region matlabError  start="\.\d\+\(\w*\)\@="hs=s+1  end="[^0-9]"he=s-1 oneline
" Numbers with double decimal points (Example: 1.2.3)
syn region matlabError  start="\<-\?\d\+\.\d\+\.[^*/\\^]"hs=e-1 end="\>"  oneline
syn region matlabError  start="\<-\?\d\+\.\d\+[eEdD][-+]\?\d\+\.[^*/\\^]"hs=e-1 end="\>"  oneline

" Operators
" Uncommment "Hilink matlabOperator" below to highlight these
syn match matlabLogicalOperator     "[&|~!]"
syn match matlabArithmeticOperator  "\.\?[-+*/\\^]"
syn match matlabRelationalOperator  "[=!~]="
syn match matlabRelationalOperator  "[<>]=\?"

" User Variables
" Uncomment this syntax group and "Hilink matlabIdentifier" below to highlight
"syn match matlabIdentifier  "\<\h\w*\>"

" Strings
syn region matlabString  start=/'/  end=/'/  skip=/\\'/ contains=matlabLineContinuation,@Spell
syn region matlabString  start=/"/  end=/"/  skip=/\\"/ contains=matlabLineContinuation,@Spell

" Standard numbers
syn match matlabNumber  "\<\d\+[ij]\?\>"
" Floating point number, with dot, optional exponent
syn match matlabFloat   "\<\d\+\(\.\d*\)\?\([edED][-+]\?\d\+\)\?[ij]\?\>"
" Floating point number, starting with a dot, optional exponent
syn match matlabFloat   "\.\d\+\([edED][-+]\?\d\+\)\?[ij]\?\>"

" Delimiters and transpose character
syn match matlabDelimiter          "[][(){}@]"
syn match matlabTransposeOperator  "[])[:alnum:]._]\@<='"

" Tabs, for possibly highlighting as errors
syn match matlabTab  "\t"
" Other special constructs
syn match matlabSemicolon  ";"
syn match matlabTilde "\~\s*[[:punct:]]"me=e-1

" Line continuations, order of matches is important here
syn match matlabLineContinuation  "\.\{3}$"
syn match matlabLineContinuation  "\\$"
syn match matlabError  "\.\{3}.\+$"hs=s+3
syn match matlabError  "\\\s\+$"hs=s+1
" Line continuations w/comments
syn match matlabLineContinuation  "\.\{3}\s*[#%]"me=e-1
syn match matlabLineContinuation  "\\\s*[#%]"me=e-1

" Comments, order of matches is important here
syn keyword matlabFIXME contained  FIXME TODO
syn match  matlabComment  "[%#].*$"  contains=matlabFIXME,matlabTab,@Spell
syn match  matlabError    "[#%][{}]"
syn region matlabBlockComment  start="^\s*[#%]{\s*$"  end="^\s*[#%]}\s*$" contains=matlabFIXME,matlabTab,@Spell

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Apply highlight groups to syntax groups defined above

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_matlab_syntax_inits")
  if version < 508
    let did_matlab_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink matlabBeginKeyword             Conditional
  HiLink matlabElseKeyword              Conditional
  HiLink matlabEndKeyword               Conditional
  HiLink matlabVarKeyword               Conditional
  HiLink matlabReserved                 Conditional

  HiLink matlabStatement                Statement
  HiLink matlabVariable                 Constant
  HiLink matlabSetVarFun                Function
  HiLink matlabCommand                  Statement
  HiLink matlabFunction                 Function

  HiLink matlabConditional              Conditional
  HiLink matlabLabel                    Label
  HiLink matlabRepeat                   Repeat
  HiLink matlabFIXME                    Todo
  HiLink matlabString                   String
  HiLink matlabDelimiter                Identifier
  HiLink matlabNumber                   Number
  HiLink matlabFloat                    Float
  HiLink matlabError                    Error
  HiLink matlabComment                  Comment
  HiLink matlabBlockComment             Comment
  HiLink matlabSemicolon                SpecialChar
  HiLink matlabTilde                    SpecialChar
  HiLink matlabLineContinuation         Special

  HiLink matlabTransposeOperator        matlabOperator
  HiLink matlabArithmeticOperator       matlabOperator
  HiLink matlabRelationalOperator       matlabOperator
  HiLink matlabLogicalOperator          matlabOperator

" Optional highlighting
"  HiLink matlabOperator                Operator
"  HiLink matlabIdentifier              Identifier
"  HiLink matlabTab                     Error

  delcommand HiLink
endif

let b:current_syntax = "matlab"

"EOF	vim: ts=2 et tw=80 sw=2 sts=0
