String getMoisEnLettre(int t) {
  return t == 1
      ? "janvier"
      : t == 2
          ? "février"
          : t == 3
              ? "mars"
              : t == 4
                  ? "avril"
                  : t == 5
                      ? "mai"
                      : t == 6
                          ? "juin"
                          : t == 7
                              ? "juillet"
                              : t == 8
                                  ? "août"
                                  : t == 9
                                      ? "septembre"
                                      : t == 10
                                          ? "octobre"
                                          : t == 11
                                              ? "novembre"
                                              : "décembre";
}
