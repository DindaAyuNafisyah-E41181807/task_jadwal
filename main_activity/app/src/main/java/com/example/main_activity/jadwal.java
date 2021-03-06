package com.example.main_activity;

import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * A simple {@link Fragment} subclass.
 * Use the {@link jadwal#newInstance} factory method to
 * create an instance of this fragment.
 */
public class jadwal extends Fragment {


    // TODO: Rename parameter arguments, choose names that match
    // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";

    // TODO: Rename and change types of parameters
    private String mParam1;
    private String mParam2;

    public jadwal() {
        // Required empty public constructor
    }

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @param param1 Parameter 1.
     * @param param2 Parameter 2.
     * @return A new instance of fragment jadwal.
     */
    // TODO: Rename and change types and number of parameters
    public static jadwal newInstance(String param1, String param2) {
        jadwal fragment = new jadwal();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, param1);
        args.putString(ARG_PARAM2, param2);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            mParam1 = getArguments().getString(ARG_PARAM1);
            mParam2 = getArguments().getString(ARG_PARAM2);
        }
    }

    private final String URL_Jadwal = "http://192.168.1.4/json_jadwal/jadwal.php";
    private RecyclerView myrecyclerview ;
    private List<JadwalItem> lstjadwal;
    private RecyclerViewAdapter_jadwal adapter;


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view =  inflater.inflate(R.layout.fragment_jadwal, container, false);
        // Inflate the layout for this fragment

        myrecyclerview = view.findViewById(R.id.jadwal_rcl);
        lstjadwal = new ArrayList<>();

        addJadwal();

        myrecyclerview.setLayoutManager(new LinearLayoutManager(getActivity().getApplicationContext()));
        adapter = new RecyclerViewAdapter_jadwal(getActivity().getApplicationContext(), lstjadwal);
        myrecyclerview.setAdapter(adapter);

        return view ;

    }

    public void addJadwal(){

        RequestQueue requestQueue = Volley.newRequestQueue(getActivity().getApplicationContext());
        JsonArrayRequest jsonRequest = new JsonArrayRequest(Request.Method.GET, URL_Jadwal, null,
                new Response.Listener<JSONArray>() {
                    @Override
                    public void onResponse(JSONArray response) {

                        for (int i = 0; i < response.length(); i++) {
                            try {
                                JSONObject jsonObject = response.getJSONObject(i);
                                JadwalItem jadwal = new JadwalItem();
                                jadwal.setMapel(jsonObject.getString("mata_pelajaran"));
                                jadwal.setStatus(jsonObject.getString("status"));
                                jadwal.setNamaguru(jsonObject.getString("nama_guru"));
                                jadwal.setWaktumengerjakan(jsonObject.getString("waktu_mengerjakan"));
                                jadwal.setStatussoal(jsonObject.getString("tipe_ujian"));
                                jadwal.setJumlahsoal(jsonObject.getString("jumlah_soal"));
                                jadwal.setWaktumulai(jsonObject.getString("waktu_mulai"));
                            } catch (JSONException e) {
                                e.printStackTrace();
                                Toast.makeText(getActivity().getApplicationContext(), "Error" + e.toString(), Toast.LENGTH_SHORT).show();
                            }
                        }

                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(getActivity().getApplicationContext(), "Error" + error.toString(), Toast.LENGTH_SHORT).show();
                    }
                });

        requestQueue.add(jsonRequest);
    }

}
