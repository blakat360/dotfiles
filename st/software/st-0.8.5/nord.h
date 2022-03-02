/* Terminal colors (16 first used in escape sequence) */
static const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#2d3241", /* black   */
  [1] = "#b14a56", /* red     */
  [2] = "#92b477", /* green   */
  [3] = "#e6c274", /* yellow  */
  [4] = "#6d8eb5", /* blue    */
  [5] = "#a5789e", /* magenta */
  [6] = "#75b3c7", /* cyan    */
  [7] = "#dfe3ed", /* white   */

  /* 8 bright colors */
  [8]  = "#3b4358", /* black   */
  [9]  = "#b14a56", /* red     */
  [10] = "#92b477", /* green   */
  [11] = "#e6c274", /* yellow  */
  [12] = "#6d8eb5", /* blue    */
  [13] = "#a5789e", /* magenta */
  [14] = "#7cafad", /* cyan    */
  [15] = "#e7ebf1", /* white   */

  /* special colors */
  [256] = "#232731", /* background */
  [257] = "#cfd6e4", /* foreground */
};

/*
 * Default colors (colorname index)
 * foreground, background, cursor, reverse cursor
 */
unsigned int defaultfg = 257;
unsigned int defaultbg = 256;
unsigned int defaultcs = 257;
static unsigned int defaultrcs = 257;

/*
 * Colors used, when the specific fg == defaultfg. So in reverse mode this
 * will reverse too. Another logic would only make the simple feature too
 * complex.
 */
static unsigned int defaultitalic = 7;
static unsigned int defaultunderline = 7;

