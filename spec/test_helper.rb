def seed_kubrick
  @director_1 = Director.create!(firstname: "Stanley",
                                 lastname: "Kubrick",
                                 alive: false,
                                 age: 70)

  @movie_1 = @director_1.movies.create!(title: "Eyes Wide Shut",
                                        runtime: 159,
                                        release: '1999-07-16',
                                        like: true,
                                        dmst_gross: 55_691_208,
                                        intl_gross: 106_551_476)

  @movie_3 = @director_1.movies.create!(title: "2001: A Space Odyssey",
                                        runtime: 149,
                                        release: '1968-04-03',
                                        like: true,
                                        dmst_gross: 60_481_243,
                                        intl_gross: 5_400_507)
end

def seed_pta
  @director_2 = Director.create!(firstname: "Paul Thomas",
                                 lastname: "Anderson",
                                 alive: true,
                                 age: 52)

  @movie_2 = @director_2.movies.create!(title: "Phantom Thread",
                                        runtime: 130,
                                        release: '2017-12-25',
                                        like: true,
                                        dmst_gross: 21_198_205,
                                        intl_gross: 47_779_793)

  @movie_4 = @director_2.movies.create!(title: "There Will Be Blood",
                                        runtime: 158,
                                        release: '2007-12-26',
                                        like: true,
                                        dmst_gross: 40_222_514,
                                        intl_gross: 35_959_874)
end